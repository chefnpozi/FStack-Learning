#!/bin/bash

# 遇到错误、未定义变量时立即退出，并确保管道命令的失败能被捕获
set -euo pipefail

cd ${FF_PATH}/lib/;

make clean;

# f-stack/mk/kern.pre.mk 注释 -Werror in line 64
make -j $(nproc);

echo "";
echo "sudo make install";
