FROM ubuntu:xenial

WORKDIR /work

ENV SDK_URL https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v11.x.x/nRF5_SDK_11.0.0_89a8197.zip
ENV SDK_FILE nRF5_SDK_11.0.0_89a8197.zip

# Install any needed packages
RUN apt-get update && apt install -y \
build-essential \
gcc-arm-none-eabi \
openocd \
git \
bzip2 \
unzip \
wget \
&& rm -rf /var/lib/apt/lists/*

RUN wget ${SDK_URL} && unzip ${SDK_FILE} -d /work
RUN sed -i "s|/usr/local/gcc-arm-none-eabi-4_9-2015q1|/usr/|g" /work/components/toolchain/gcc/Makefile.posix
CMD bash