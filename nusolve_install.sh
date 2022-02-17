#!/bin/bash
#########################################################################
# File Name: netcdf_install.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Tue 22 Sep 2020 01:50:39 PM CST
#########################################################################

# PREFIX=~/scisoft
PREFIX=/data/softwares
VER=0.7.1

cd $PREFIX/incoming
# Download package from sourceforge.com

# Unzip
cd $PREFIX/dist
# tar -xzf $PREFIX/incoming/nusolve-${VER}.tar.gz

cd nusolve-${VER}

# Make some modifications to the source code

# Build
if [ -d build ]; then
    rm -r build
fi
mkdir build && cd build

../configure --prefix=/opt64/nusolve
#../configure --prefix=/opt64/nusolve \
#   --with-qt-include=/usr/include/x86_64-linux-gnu/qt5/ \
#   --with-qt-lib=/usr/lib/x86_64-linux-gnu \
#   --with-qt-bin=/usr/lib/qt5/bin
# ../configure --prefix=/opt32 \
#    --with-netcdf-include=/opt32/include \
#    --with-netcdf-lib=/opt32/lib

make
make install
make check
make distclean

