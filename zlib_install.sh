#!/bin/bash
export CC=icc
export CXX=icpc
export FC=ifort
export F90=ifort
export F77=ifort

PREFIX=/data/softwares
ver=1.2.11

# download maunally http://www.zlib.net/zlib-${ver}.tar.gz
cd $PREFIX/incoming
wget http://zlib.net/zlib-1.2.11.tar.gz

cd $PREFIX/dist
tar -zxvf $PREFIX/incoming/zlib-${ver}.tar.gz 
cd zlib-${ver}

CPPFLAGS='-m32' CFLAGS='-m32' ./configure --prefix=/opt32 --shared

make
make install
make clean

# For Ubuntu 18.04 
# sudo apt-get install libz-dev

# For Ubuntu 20.04 (32-/64-bit)
