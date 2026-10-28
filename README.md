# xdma_driver_2020_2：修复版 XDMA 驱动与 4GB DDR 测试

本目录基于 Xilinx 官方 `dma_ip_drivers` 仓库的 `2020.2` 分支（提交 `785995783c78b2cbec6458141c4395e204c5bd9b`），保留原版驱动结构并加入 Linux 6.8 兼容修复。除官方测试外只增加一个 4GB DDR 测试脚本。

官方驱动仓库：

<https://github.com/Xilinx/dma_ip_drivers/tree/2020.2>

## 驱动修复

相对官方 2020.2 分支的修复内容位于：

```text
XDMA/linux-kernel/xdma/cdev_ctrl.c
XDMA/linux-kernel/xdma/cdev_sgdma.c
XDMA/linux-kernel/xdma/libxdma.c
XDMA/linux-kernel/xdma/xdma_cdev.c
```

主要包括 Linux 6.4+ `class_create` 接口兼容、DMA API 兼容和 XDMA 字符设备/SGDMA 路径修复。驱动版本仍基于 Xilinx XDMA v2020.2.2。

## 编译

在目标 Linux 主机执行：

```bash
cd XDMA/linux-kernel/xdma
make clean
make -C /lib/modules/$(uname -r)/build M=$PWD modules
```

编译成功后，测试脚本默认从：

```text
XDMA/linux-kernel/xdma/xdma.ko
```

加载模块。

## 4GB DDR 地址

| DDR | 地址范围 | 大小 |
|---|---:|---:|
| C0 | `0x00000000–0x7fffffff` | 2 GiB |
| C1 | `0x80000000–0xffffffff` | 2 GiB |

测试脚本使用 `0x01000000` 和 `0x81000000` 等地址，避免低地址控制区域。

## 驱动加载和基础测试

```bash
cd XDMA/linux-kernel/tests
sudo ./load_driver.sh
sudo ./run_test.sh
```

单通道基础测试：

```bash
sudo ./dma_memory_mapped_test.sh xdma0 1024 1 1 1
```

## 4GB DDR 测试（唯一新增脚本）

`4gb_ddr_test.sh` 是额外加入的唯一 DDR 测试脚本。它使用 Python shebang 实现，但可以像普通 Shell 脚本一样直接运行，对 DDR C0/C1 执行单通道、双通道和并发读写，覆盖 1KiB/4KiB 数据块：

```bash
sudo ./4gb_ddr_test.sh
```

也可以显式调用 Python：

```bash
sudo python3 4gb_ddr_test.sh
```

测试覆盖：

- DDR C0/C1 的 1KiB 和 4KiB 单通道读写；
- 两路 H2C/C2H DMA；
- C0/C1 地址范围和边界访问；
- 顺序与并发读写的数据完整性校验。

## 中断模式

`load_driver.sh` 支持：

```text
0  自动
1  MSI
2  Legacy INTx
3  MSI-X 请求
4  poll mode，不使用中断
```

可通过 `/proc/interrupts` 和 `lspci -s 01:00.0 -vv` 检查 IRQ 计数及 MSI 状态。当前设备没有独立 MSI-X 能力时，模式 3 可能回退到 Legacy。

## 限制

- 本副本不包含 `.o`、`.ko`、编译缓存和历史测试结果；这些文件需要在目标内核上重新生成。
- 本分支不包含 ADD/vector 测试脚本；vector add 控制寄存器和计算结果测试属于其他工程。
- 本分支不包含 JTAG 热加载 PCI 配置恢复脚本；热加载时需使用独立的主机恢复流程。
