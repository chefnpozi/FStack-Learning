#!/bin/bash

# 遇到错误、未定义变量时立即退出，并确保管道命令的失败能被捕获
set -euo pipefail

cd ${FF_PATH}/dpdk;

if [ ! -d "build" ]; then
    rm -rf build;
fi

meson setup build -Dbuildtype=debug -Denable_kmods=true;

ninja -C build;

sudo ninja -C build install
sudo ldconfig

sudo modprobe uio
sudo insmod build/kernel/linux/igb_uio/igb_uio.ko

# 使用 PCI 地址进行绑定
sudo python3 usertools/dpdk-devbind.py --bind=igb_uio 0000:07:00.0
sudo python3 usertools/dpdk-devbind.py --status
