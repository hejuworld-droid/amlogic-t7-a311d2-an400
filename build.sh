#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARMBIAN_DIR="${SCRIPT_DIR}/build"

if [ ! -d "${ARMBIAN_DIR}" ]; then
    echo "Cloning Armbian build system..."
    git clone --depth=1 https://github.com/armbian/build.git "${ARMBIAN_DIR}"
fi

cp -v "${SCRIPT_DIR}/config/boards/an400.conf" "${ARMBIAN_DIR}/config/boards/"

mkdir -p "${ARMBIAN_DIR}/packages/bsp/meson-s4t7/an400/etc/initramfs-tools"
mkdir -p "${ARMBIAN_DIR}/packages/bsp/meson-s4t7/an400/etc/modprobe.d"
cp -rv "${SCRIPT_DIR}/config/packages/bsp/meson-s4t7/an400/"* "${ARMBIAN_DIR}/packages/bsp/meson-s4t7/an400/"

mkdir -p "${ARMBIAN_DIR}/patch/u-boot/u-boot-meson-s4t7"
if ls "${SCRIPT_DIR}/patch/u-boot/u-boot-meson-s4t7/"*.patch 1>/dev/null 2>&1; then
    cp -v "${SCRIPT_DIR}/patch/u-boot/u-boot-meson-s4t7/"*.patch "${ARMBIAN_DIR}/patch/u-boot/u-boot-meson-s4t7/"
fi

echo "=== BSP directory structure ==="
find "${ARMBIAN_DIR}/packages/bsp/meson-s4t7/" -type f
echo "=== U-Boot patches ==="
ls -la "${ARMBIAN_DIR}/patch/u-boot/u-boot-meson-s4t7/"

cd "${ARMBIAN_DIR}"

./compile.sh \
    BOARD=an400 \
    BRANCH=legacy \
    RELEASE=bookworm \
    BUILD_DESKTOP=no \
    BUILD_MINIMAL=yes \
    KERNEL_CONFIGURE=no
