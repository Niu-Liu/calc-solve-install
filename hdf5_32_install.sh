#!/bin/bash
#########################################################################
# File Name: hdf5_install.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Sat 31 Oct 2020 04:33:08 PM CST
#########################################################################

PREFIX=/data/softwares

export CC=icc
export CXX=icpc
export FC=ifort
export F90=ifort
export F77=ifort

# cd $PREFIX/incoming
# Download the source code

# Unzip
# cd $PREFIX/dist
# tar -xzf $PREFIX/incoming/hdf5-1_12_0.tar.gz

cd ${PREFIX}/dist/hdf5-1.12.0
make distclean

if [ ! -d build ]; then
    mkdir build
fi
cd build

# CFLAGS='-m32 -I/opt32/include' CPPFLAGS='-m32 -I/opt32/include' \
#     FFLAGS='-m32 -I/opt32/include' \
#     LDFLAGS='-L/opt32/lib -L/usr/lib/i386-linux-gnu' \
#     ../configure --prefix=/opt32 
CFLAGS='-m32' \
    CPPFLAGS='-m32' \
    FFLAGS='-m32' \
    ../configure --prefix=/opt32  --enable-fortran --enable-hl --with-zlib=/opt32
# ./configure --prefix=/opt32 --enable-fortran --enable-hl
#   LDFLAGS='-L/usr/lib/i386-linux-gnu -L/data/softwares/opt32/lib' \
#   LDFLAGS='-L/usr/lib/i386-linux-gnu -L/data/softwares/opt32/lib' \

if (( $? ));
then
    echo "Configuration failed."
    exit
fi

make
if (( $? ));
then
    echo "Make failed."
    exit
fi

make install
if (( $? ));
then
    echo "Make install failed."
    exit
fi

make distclean
if (( $? ));
then
    echo "Make clean failed."
    exit
fi

