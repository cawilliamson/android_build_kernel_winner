#!/usr/bin/env bash

# fetch kernel sources
git clone \
  -b ${1:-master} \
  https://github.com/cawilliamson/android_kernel_samsung_winnerx \
  /usr/src/kernel

# change working directory
cd /usr/src/kernel

# start kernel build script
bash build_kernel.sh

# remove previous images
rm -f /out/Image-dtb

# copy kernel image out
cp -fv \
  /usr/src/kernel/arch/arm64/boot/Image-dtb \
  /out/Image-dtb
