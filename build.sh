#!/usr/bin/env bash

docker build -t buildkernel .
docker run \
  -v $(pwd)/common:/common \
  -v $(pwd)/out:/out \
  buildkernel \
  /bin/bash -c " \
    /common/scripts/1_build_kernel.sh ${1} && \
    /common/scripts/2_build_zip.sh && 
    /common/scripts/3_fix_permissions.sh \
  "
