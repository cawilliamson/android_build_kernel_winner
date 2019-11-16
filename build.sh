#!/usr/bin/env bash

docker build -t buildkernel .
docker run \
  -v $(pwd)/out:/out \
  buildkernel \
  /bin/bash -c " \
  git clone \
    -b ${1:-master} \
    https://github.com/cawilliamson/android_kernel_samsung_winnerx \
    /usr/src/kernel && \
  cd /usr/src/kernel && \
  bash build_kernel.sh && \
  cp -fv /usr/src/kernel/arch/arm64/boot/Image-dtb /out/Image-dtb && \
  chmod -v 777 /out/*"
