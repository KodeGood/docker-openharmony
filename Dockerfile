FROM ubuntu:22.04
WORKDIR /home/openharmony

# Following are taken from docs/docker/Dockerfile
RUN apt-get update -y \
  && apt-get install -y apt-utils binutils bison flex bc build-essential make mtd-utils gcc-multilib g++-multilib u-boot-tools python3 python3-pip git zip unzip curl wget gcc g++ ruby dosfstools mtools default-jre default-jdk scons python3-distutils perl openssl libssl-dev cpio git-lfs m4 ccache zlib1g-dev tar rsync liblz4-tool genext2fs binutils-dev device-tree-compiler e2fsprogs git-core gnupg gnutls-bin gperf lib32ncurses5-dev libffi-dev zlib* libelf-dev libx11-dev libgl1-mesa-dev lib32z1-dev xsltproc x11proto-core-dev libc6-dev-i386 libxml2-dev lib32z-dev libdwarf-dev \
  && apt-get install -y grsync xxd libglib2.0-dev libpixman-1-dev kmod jfsutils reiserfsprogs xfsprogs squashfs-tools pcmciautils quota ppp libtinfo-dev libtinfo5 libncurses5 libncurses5-dev libncursesw5 libstdc++6 python2.7 gcc-arm-none-eabi \
  && apt-get install -y vim ssh locales \
  && apt-get install -y doxygen \
  && locale-gen "en_US.UTF-8" \
  && curl https://gitee.com/oschina/repo/raw/fork_flow/repo-py3 > /usr/bin/repo \
  && chmod +x /usr/bin/repo \
  && pip3 install -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com requests setuptools pymongo kconfiglib pycryptodome ecdsa ohos-build pyyaml prompt_toolkit==1.0.14 redis json2html yagmail python-jenkins \
  && pip3 install esdk-obs-python --trusted-host pypi.org \
  && pip3 install six --upgrade --ignore-installed six \
  # === These are my additions ===
  && apt-get install -y cmake libaio-dev libxkbcommon-dev libudev-dev libsdl2-dev libpng-dev libjpeg-dev libsasl2-dev libcapstone-dev libfdt-dev libkeyutils-dev libsphinxbase-dev ninja-build \
  && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs \
  # ==============================
  && npm install -g @ohos/hpm-cli --registry https://mirrors.huaweicloud.com/repository/npm/ \
  # clean apt cache to keep image small
  && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
