#!/bin/bash

set -euo pipefail

cd ${FF_PATH}/dpdk;

sudo ninja -C build install;
sudo ldconfig;

sudo modprobe uio
sudo insmod build/kernel/linux/igb_uio/igb_uio.ko

# 使用 PCI 地址进行绑定
sudo python3 usertools/dpdk-devbind.py --bind=igb_uio 0000:07:00.0
sudo python3 usertools/dpdk-devbind.py --status

