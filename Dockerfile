FROM ubuntu
MAINTAINER panykeywr at gmail
RUN apt-get update
# enable 32 bit code to run on 64 bit machine
RUN apt-get -y install lib32z1
# install the gcc tools to enable compilation
RUN apt-get -y install gcc build-essential libncurses5-dev mtd-utils u-boot-tools

RUN apt-get -y install wget unzip 

RUN wget -c ftp://ftp.dlink.de/dns/dns-315/driver_software/DNS-315_sw_reva_GPLCode_100_all_en_20120313.zip
RUN unzip DNS-315_sw_reva_GPLCode_100_all_en_20120313.zip
RUN rm DNS-315_sw_reva_GPLCode_100_all_en_20120313.zip
RUN tar xjf DNS-315/DNS-315_A1_GPL_FW_1.00.tar.bz2
RUN rm -R DNS-315


WORKDIR /DNS-315_GPL_v1.00/GPL/
RUN echo $(pwd)

RUN tar xjf crosstool.tar.bz2
RUN ln crosstool/OXNAS820/gcc-4.2.4-glibc-2.7-toolchain/cross-tools/i386-cross-linux-gnu/arm-unknown-linux-gnueabi/lib/libbfd-2.19.1.20090309.so /lib/libbfd-2.19.1.20090309.so
RUN ln crosstool/OXNAS820/gcc-4.2.4-glibc-2.7-toolchain/cross-tools/i386-cross-linux-gnu/arm-unknown-linux-gnueabi/lib/libopcodes-2.19.1.20090309.so /lib/libopcodes-2.19.1.20090309.so

RUN tar xjf linux-kernel.tar.bz2

WORKDIR /

COPY nas-build.sh .
CMD ./nas-build.sh
