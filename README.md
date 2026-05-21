# Armbian for Amlogic T7/A311D2 (AN400)

## Build Armbian for Amlogic T7/A311D2 AN400 with mainline kernel, using pre-installed bootloader (no U-Boot build).

---

## Device Specs
| Spec | Details |
|------|---------|
| SoC | Amlogic A311D2 (T7) |
| Memory | LPDDR4X 4GB |
| Storage | eMMC + SD Card |
| DTB | `amlogic-t7-a311d2-an400.dtb` (Linux 6.6+ mainline) |
| Console | `ttyAML0`, baudrate 115200 |

---

## GitHub Actions Build (Automatic)
1. Fork this repo
2. Enable Actions
3. Go to **Actions** → **Build Armbian for A311D2 AN400**
4. Click **Run workflow** (branch: master)
5. Wait ~2-3 hours for build
6. Download artifacts from the run

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

### USB Burning Tool (Windows)
Use Amlogic USB Burning Tool to flash.

---

## Build Config
| Option | Value |
|--------|-------|
| BOARD | an400 |
| BRANCH | edge (Linux 6.6+) |
| RELEASE | bookworm / noble |
| BUILD_DESKTOP | yes / no |

---

## References
- [Armbian Build Guide](https://docs.armbian.com/Developer-Guide_Build-Preparation/)
- [Linux mainline DTS A311D2 support](https://github.com/torvalds/linux/tree/master/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts)
