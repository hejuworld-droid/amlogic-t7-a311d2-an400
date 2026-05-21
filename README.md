# Armbian for Amlogic A311D2 AN400

## Device Specs
| Spec | Details |
|------|---------|
| SoC | Amlogic A311D2 (T7), Chip ID = 0x36 |
| CPU | 4x Cortex-A73 @ ~2.2GHz + 4x Cortex-A53 @ ~2.0GHz |
| GPU | Mali-G52 MP2 |
| NPU | 5 TOPS |
| Memory | LPDDR4X 8GB (Dual Channel, cs0=4GB + cs1=4GB) |
| Storage | eMMC 64GB + SD Card |
| WiFi/BT | Broadcom BCM4362 (dhd driver) |
| Ethernet | DWMAC |
| Console | ttyS0, baudrate 115200 |
| DTB | `amlogic/t7_a311d2_an400.dtb` (legacy 5.15 vendor kernel) |

---

## Boot Chain
```
ROM → BL2 → DDR Init (LPDDR4X, 1848MHz, Dual Channel)
    → BL2E → BL2X → DDRFIP → DEVFIP
        → BL30 (SCP) → BL31 (TF-A) → BL32 (OP-TEE) → BL33 (U-Boot 2019.01) → BL40
```

---

## GitHub Actions Build (Automatic)
1. Push to master branch triggers automatic build
2. Or go to **Actions** → **Build Armbian for A311D2 AN400** → **Run workflow**
3. Wait ~3-4 hours for build
4. Download artifacts from the run

---

## Manual Build
```bash
git clone https://github.com/hejuworld-droid/amlogic-t7-a311d2-an400.git
cd amlogic-t7-a311d2-an400
chmod +x build.sh
./build.sh
```

---

## Installation

### SD Card
```bash
sudo dd if=Armbian-unofficial_*.img of=/dev/sdX bs=1M status=progress
```

---

## Build Config
| Option | Value |
|--------|-------|
| BOARD | an400 |
| BOARDFAMILY | meson-s4t7 |
| BRANCH | legacy (Linux 5.15 vendor kernel) |
| RELEASE | bookworm / noble |
| BUILD_MINIMAL | yes |
| BOOTCONFIG | kvim4_defconfig |
| KHADAS_BOARD_ID | kvim4 |

---

## U-Boot Patches
- `zz-AN400-Change-bootdelay-to-3.patch`: Change bootdelay from 2 to 3 seconds
- `zz-AN400-Modify-board-id.patch`: Change board identification from VIM4 to AN400

---

## References
- [Armbian Build Guide](https://docs.armbian.com/Developer-Guide_Build-Preparation/)
- [meson-s4t7 family config](https://github.com/armbian/build/blob/main/config/sources/families/meson-s4t7.conf)
- [Khadas VIM4 board config](https://github.com/armbian/build/blob/main/config/boards/khadas-vim4.conf)
