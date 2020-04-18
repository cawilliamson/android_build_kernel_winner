FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install \
  bc \
  build-essential \
  curl \
  git \
  libssl-dev \
  python \
  python3 \
  wget \
  zip

RUN git clone \
  --depth=1 \
  https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 \
  /opt/aarch64-linux-android-4.9

RUN git clone \
  --depth=1 \
  https://github.com/pgjh/qcom-clang-8.git \
  /opt/qcom-clang-8
