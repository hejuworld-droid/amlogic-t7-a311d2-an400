# Armbian for A311D2 AN400 开发板

基于 [Armbian 官方构建系统](https://github.com/armbian/build)，为 **Amlogic A311D2 AN400** 主板定制 Armbian。

## 硬件信息

| 项目 | 规格 |
|------|------|
| SOC | Amlogic A311D2 (T7) |
| 内存 | LPDDR4X 4GB |
| 存储 | eMMC + SD 卡 |
| DTB | `amlogic-t7-a311d2-an400.dtb` (Linux 6.6+ 主线支持) |
| 串口 | `ttyAML0`, 波特率 115200 |

## GitHub Actions 构建（推荐）

1. 打开 Actions 页面
2. 选择 **Build Armbian for A311D2 AN400**
3. 点击 **Run workflow**
4. 选择系统版本（bookworm / noble）
5. 选择是否包含桌面环境
6. 等待构建完成（约 2-3 小时）
7. 在构建完成的 run 页面下载 Artifact

## 本地构建

```bash
git clone https://github.com/hejuworld-droid/amlogic-t7-a311d2-an400.git
cd amlogic-t7-a311d2-an400
chmod +x build.sh
./build.sh
```

## 刷机方法

### SD 卡
```bash
sudo dd if=Armbian-unofficial_*.img of=/dev/sdX bs=1M status=progress
```

### USB Burning Tool (Windows)
使用 Amlogic USB Burning Tool 刷入镜像。

## 构建参数

| 参数 | 值 |
|------|------|
| BOARD | an400 |
| BRANCH | edge (Linux 6.6+) |
| RELEASE | bookworm / noble |
| BUILD_DESKTOP | yes / no |

## 参考

- [Armbian 官方构建文档](https://docs.armbian.com/Developer-Guide_Build-Preparation/)
- [Linux 主线 A311D2 设备树](https://github.com/torvalds/linux/tree/master/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts)
