#!/bin/bash
# Amlogic A311D2 AN400 Armbian 本地构建脚本
set -e

echo "=== A311D2 AN400 Armbian 本地构建 ==="

check_deps() {
    echo "检查构建依赖..."
    local deps=("git" "make" "gcc" "bc" "device-tree-compiler" "flex" "bison")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo "缺少: $dep"
            sudo apt-get install -y build-essential bc device-tree-compiler flex bison
            return
        fi
    done
}

if [ ! -d "build" ]; then
    echo "克隆 Armbian 构建系统..."
    git clone --depth=1 https://github.com/armbian/build.git
fi

echo "复制板级配置..."
cp -v config/boards/an400.conf build/config/boards/

cd build

echo "安装依赖..."
./compile.sh prerequisites || true

echo "开始构建..."
./compile.sh \
    BOARD=an400 \
    BRANCH=edge \
    RELEASE=bookworm \
    BUILD_DESKTOP=no \
    BUILD_MINIMAL=yes \
    KERNEL_CONFIGURE=no

echo "=== 构建完成 ==="
echo "镜像: build/output/images/"
