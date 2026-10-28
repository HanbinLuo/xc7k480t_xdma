# xdma_480t：无 ADD、4GB DDR Vivado 基线

这是一个不包含 `axi_vector_add_0` 的 Kintex-7 XDMA 基线工程，参考目录为：

```text
C:/fpga_learning/vivado_project/480t/xdma_archive_test/xdma
```

工程包含 XDMA、AXI Interconnect、双通道 MIG DDR 和原始 `ila_0`。Block Design 的 AXI Interconnect 为 `NUM_SI=1`、`NUM_MI=4`，没有第二个 AXI master。

## DDR 地址

| 区域 | 地址范围 | 大小 |
|---|---:|---:|
| DDR C0 | `0x00000000–0x7fffffff` | 2 GiB |
| DDR C1 | `0x80000000–0xffffffff` | 2 GiB |
| 总容量 | `0x00000000–0xffffffff` | 4 GiB |

XDMA 的 DDR 访问使用 `M_AXI`。MIG 控制寄存器映射位于 4GB 地址空间之外，不属于普通 DDR 数据缓冲区。

## 工程文件

打开：

```text
xdma.xpr
```

已验证参考 bit/ltx：

```text
bitstreams/reference/design_1_wrapper.bit
bitstreams/reference/design_1_wrapper.ltx
```

bit SHA256：`38D10399DA1179FEBE01F12D19680B66917B0CC7F9D4DFDB9C63EBABE92D3105`。

ltx SHA256：`2B469351411FBFE19919F07FC5C961CBECB7013A7199C730950D8FB8A3F51AD5`。

## 使用方式

1. 使用 Vivado 2020.2 打开 `xdma.xpr`。
2. 在 Block Design 中确认不存在 `axi_vector_add_0`，且 `NUM_SI=1`。
3. 运行 `Validate Design`，再生成综合、实现和 bitstream。
4. 通过 Hardware Manager 下载 bitstream。
5. Linux 主机侧使用修复版 XDMA 驱动进行 DMA 测试。

本工程只用于 XDMA/DDR 基线对照；向量加法控制寄存器和 vector master 不属于该工程。
