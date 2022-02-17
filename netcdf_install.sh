#!/bin/bash
#########################################################################
# File Name: netcdf_install.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Tue 22 Sep 2020 01:50:39 PM CST
#########################################################################

# A now way to install this library is
# sudo apt install libnetcdff-dev libnetcdf-dev libnetcdf-c++4-dev
# However, it just works for 64-bit

PREFIX=~/scisoft
FVER=4.5.3
CVER=4.7.4
CPVER=4.3.1

cd $PREFIX/incoming
# wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-cxx4-${CPVER}.tar.gz
# wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-${CVER}.tar.gz
# wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-${FVER}.tar.gz

# Unzip
cd $PREFIX/dist
# tar -xvzf $PREFIX/incoming/netcdf-fortran-${FVER}.tar.gz
# tar -xvzf $PREFIX/incoming/netcdf-c-${CVER}.tar.gz
# tar -xvzf $PREFIX/incoming/netcdf-cxx4-${CPVER}.tar.gz

# Install C-version
cd netcdf-c-${CVER}
make distclean

if [ -d build32 ]; then
    rm -r build32
fi
mkdir build32 && cd build32

CPPFLAGS='-m32 -I/opt32/include -I/usr/include/i386-linux-gnu' \
    CFLAGS='-m32' \
    LDFLAGS='-L/opt32/lib -L/usr/lib/i386-linux-gnu' \
    ../configure --prefix=/opt32 \
    --with-hdf4=/opt32/include

make
make install
# make check
make distclean

cd ..

# Install CPP
cd netcdf-cxx4-${CPVER}
make distclean

if [ -d build32 ]; then
    rm -r build32
fi
mkdir build32 && cd build32

CFLAGS='-m32' CPPFLAGS='-I/opt32/include' \
    LDFLAGS='-L/opt32/lib -L/usr/lib/i386-linux-gnu' \
    ../configure --prefix=/opt32
make
make install
# make check
make distclean
 
cd ..

cd netcdf-fortran-${FVER}
if [ -d build32 ]; then
    rm -r build32
fi
mkdir build32 && cd build32

CFLAGS='-m32' CPPFLAGS='-I/opt32/include' \
    FCFLAGS='-m32' FFLAGS='-m32' \
    LDFLAGS='-L/opt32/lib' \
    ../configure --prefix=/opt32 \
    --disable-fortran-type-check

make
make install
# make check
make distclean
