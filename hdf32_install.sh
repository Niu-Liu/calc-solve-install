#!/bin/bash
#########################################################################
# File Name: hdf_install.sh
# Author: Neo
# mail: niu.liu@nju.edu.cn
# Created Time: Sat 31 Oct 2020 04:33:08 PM CST
#########################################################################

PREFIX=/data/softwares

ver=4.2.15

# cd $PREFIX/incoming
# wget https://support.hdfgroup.org/ftp/HDF/releases/HDF${ver}/src/hdf-${ver}.tar.gz

# Unzip
cd $PREFIX/dist
# tar -xf $PREFIX/incoming/hdf-${ver}.tar.gz

# Install C-version
cd hdf-${ver}
make distclean

if [ ! -d build ]; then
    mkdir build
fi
cd build

CFLAGS='-m32 -I/usr/include/tirpc' \
    CPPFLAGS='-m32 -I/usr/include/tirpc' \
    CXXFLAGS='-m32' FFLAGS='-m32' \
    LDFLAGS='-ltirpc -L/opt32/lib' \
    ../configure --prefix=/opt32 --disable-netcdf --enable-fortran \
    --with-szip=/opt32 --with-jpeg=/opt32 --with-zlib=/opt32
#   LDFLAGS='-ltirpc -L/opt32/lib -L/usr/lib/i386-linux-gnu' \

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

