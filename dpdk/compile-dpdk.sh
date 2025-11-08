#!/bin/bash

# 遇到错误、未定义变量时立即退出，并确保管道命令的失败能被捕获
set -euo pipefail

cd ${FF_PATH}/dpdk;

if [ -d "build" ]; then
    rm -rf build;
fi

meson setup build -Dbuildtype=debug -Denable_kmods=true;

ninja -C build -j $(nproc);

echo ""

cat sudo-install-mount.sh;

echo ""

echo "sudo -E sudo-install-mount.sh";

