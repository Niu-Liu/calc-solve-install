#!/usr/bin/bash
#########################################################################
# File Name: jpg_install.sh
# Author: Neo
# Mail: niu.liu@nju.edu.cn
# Created Time: Tue 08 Feb 2022 07:03:26 PM CST
#########################################################################

export CC=icc
export CXX=icpc
export FC=ifort
export F90=ifort
export F77=ifort

PREFIX=/data/softwares

# download maunally http://www.zlib.net/zlib-${ver}.tar.gz
cd $PREFIX/incoming
#wget http://www.ijg.org/files/jpegsr9.zip

cd $PREFIX/dist
#unzip $PREFIX/incoming/jpegsr9.zip
cd jpeg-9e

chmod +x configure
CPPFLAGS='-m32' CFLAGS='-m32' ./configure --prefix=/opt32 

make
make install
make clean
