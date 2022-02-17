#!/usr/bin/bash
#########################################################################
# File Name: szip_install.sh
# Author: Neo
# Mail: niu.liu@nju.edu.cn
# Created Time: Tue 08 Feb 2022 07:24:04 PM CST
#########################################################################
export CC=icc
export CXX=icpc
export FC=ifort
export F90=ifort
export F77=ifort

PREFIX=/data/softwares

# download maunally http://www.zlib.net/zlib-${ver}.tar.gz
cd $PREFIX/incoming
wget https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz

cd $PREFIX/dist
tar -xvzf ${PREFIX}/incoming/szip-2.1.1.tar.gz

cd szip-2.1.1

CPPFLAGS='-m32' CFLAGS='-m32' ./configure --prefix=/opt32 

make
make install
make clean
