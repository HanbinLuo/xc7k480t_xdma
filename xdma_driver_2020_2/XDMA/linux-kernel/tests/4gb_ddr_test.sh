#!/usr/bin/env python3
"""Run real XDMA reads/writes with unique data; reserve DDR 0x01000000..0x01010000."""
import concurrent.futures as cf
import json
import random
import subprocess
import tempfile
from pathlib import Path

def transfer(direction, channel, address, data_or_size):
    size = len(data_or_size) if direction == 'h2c' else data_or_size
    tools = '/home/lhb/fpga/dma_ip_drivers_2020_2/XDMA/linux-kernel/tools'
    with tempfile.NamedTemporaryFile() as f:
        if direction == 'h2c':
            f.write(data_or_size)
            f.flush()
        tool = 'dma_to_device' if direction == 'h2c' else 'dma_from_device'
        result = subprocess.run([f'{tools}/{tool}', '-d', f'/dev/xdma0_{direction}_{channel}',
            '-a', str(address), '-s', str(size), '-c', '1', '-f', f.name], capture_output=True, timeout=20)
        if result.returncode:
            raise RuntimeError(result.stdout.decode()+result.stderr.decode())
        if direction == 'c2h':
            f.seek(0)
            payload = f.read()
            assert len(payload) == size, len(payload)
            return payload

def run_case(base, wc, rc, parallel_write, parallel_read, rounds=6, size=4096):
    failures = []
    for iteration in range(rounds):
        rng = random.Random(iteration + 751)
        expected = [rng.randbytes(size) for _ in range(4)]
        with cf.ThreadPoolExecutor(4) as pool:
            if parallel_write:
                futures = [pool.submit(transfer, 'h2c', i % wc, base+i*size, expected[i]) for i in range(4)]
                for f in futures: f.result()
            else:
                for i in range(4): transfer('h2c', i % wc, base+i*size, expected[i])
            if parallel_read:
                futures = [pool.submit(transfer, 'c2h', i % rc, base+i*size, size) for i in range(4)]
                actual = [f.result() for f in futures]
            else:
                actual = [transfer('c2h', i % rc, base+i*size, size) for i in range(4)]
        for i, (a, b) in enumerate(zip(expected, actual)):
            if a != b:
                # Reread sequentially twice, without rewriting memory.
                second = transfer('c2h', 0, base+i*size, size)
                third = transfer('c2h', 1, base+i*size, size)
                first = next(j for j in range(size) if a[j] != b[j])
                failures.append(dict(iteration=iteration, block=i, first=first,
                    mismatches=sum(x!=y for x,y in zip(a,b)),
                    reread0_ok=second==a, reread1_ok=third==a,
                    repeat_equal=second==b, first_expected=a[first:first+24].hex(),
                    first_actual=b[first:first+24].hex()))
                Path('/tmp/xdma_diag').mkdir(exist_ok=True)
                for label, payload in [('expected', a), ('actual', b), ('reread', second)]:
                    Path(f'/tmp/xdma_diag/{label}.bin').write_bytes(payload)
    print(json.dumps(dict(base=hex(base), write_channels=wc, read_channels=rc,
        parallel_write=parallel_write, parallel_read=parallel_read,
        blocks=rounds*4, failed_blocks=len(failures), examples=failures[:3])), flush=True)
    return len(failures)

if __name__ == '__main__':
    failures = 0
    for base in [0x01000000, 0x81000000]:
        for wc, rc, pw, pr in [(1,1,False,False),(2,2,False,False),
                              (2,1,True,False),(1,2,False,True),(2,2,True,True)]:
            failures += run_case(base,wc,rc,pw,pr)
    raise SystemExit(bool(failures))
