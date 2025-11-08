#!/bin/bash

# 遇到错误、未定义变量时立即退出，并确保管道命令的失败能被捕获
set -euo pipefail

cd ${FF_PATH}/app/nginx-1.28.0/;

make clean;

./configure --prefix=/usr/local/nginx_fstack \ 
            --with-ff_module \
            --with-debug;

make -j $(nproc);

sudo make install;
