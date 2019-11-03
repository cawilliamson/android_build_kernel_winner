#!/usr/bin/env bash

docker build -t buildkernel .
docker run \
  -v $(pwd)/out:/out \
  buildkernel \
  /bin/bash -c " \
  git clone \
    -b leankernel-9.0 \
    https://github.com/cawilliamson/android_kernel_samsung_winner \
    /usr/src/kernel && \
  cd /usr/src/kernel && \
  bash build_kernel_${1}.sh && \
  cp -fv /usr/src/kernel/arch/arm64/boot/Image-dtb /out/Image-dtb && \
  chmod -v 777 /out/*"
