#!/bin/sh

cd DNS-315_GPL_v1.00/GPL/

export WORKDIR=$(pwd)
export PATH=${WORKDIR}/crosstool/OXNAS820/gcc-4.2.4-glibc-2.7-toolchain/cross-tools/bin:$PATH
export CC=arm-linux-gcc
export CROSS_COMPILE=arm-linux-
export CXX=${CROSS_COMPILE}g++
export RANLIB=arm-linux-ranlib
export LD=arm-linux-ld
export STRIP=arm-linux-strip
env|sort


# Configure Kernel
cd ./linux-kernel
#sh cv.sh
# Clean up
make clean

# Menubased configuration
#make menuconfig
# Make Kernel
#make
# Make Kernelmodules
make modules
# Make uImage
#make uImage
mkdir /builded-modules
find / -iname "*.ko" -type f -exec /bin/mv {} /builded-modules/ \;
cd ../

