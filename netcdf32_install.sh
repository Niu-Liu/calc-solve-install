#!/bin/bash
#########################################################################
# File Name: netcdf_install.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Tue 22 Sep 2020 01:50:39 PM CST
#########################################################################

export CC=icc
export CXX=icpc
export FC=ifort
export F90=ifort
export F77=ifort
export LD_LIBRARY_PATH="/opt32/lib"

PREFIX=/data/softwares
FVER=4.5.4
CVER=4.8.1
CPVER=4.3.1

cd $PREFIX/incoming
# wget https://downloads.unidata.ucar.edu/netcdf-cxx/${CPVER}/netcdf-cxx4-${CPVER}.tar.gz
# wget https://downloads.unidata.ucar.edu/netcdf-c/${CVER}/src/netcdf-c-${CVER}.tar.gz
# wget  https://downloads.unidata.ucar.edu/netcdf-fortran/${FVER}/netcdf-fortran-${FVER}.tar.gz

# Unzip
cd $PREFIX/dist
# tar -xvzf $PREFIX/incoming/netcdf-fortran-${FVER}.tar.gz
# tar -xvzf $PREFIX/incoming/netcdf-c-${CVER}.tar.gz
# tar -xvzf $PREFIX/incoming/netcdf-cxx4-${CPVER}.tar.gz

# # Install C-version
# cd netcdf-c-${CVER}
# make distclean
#  
# if [ -d build ]; then
#     rm -r build
# fi
# mkdir build && cd build
#  
# Install C
# #CFLAGS="-m32" LDFLAGS='-L/opt32/lib -L/usr/lib/i386-linux-gnu' \
# CFLAGS="-m32" LDFLAGS='-L/opt32/lib' \
#    CPPFLAGS='-m32 -I/opt32/include' \
#    ../configure --prefix=/opt32  --with-hdf4=/opt32/include
# 
# 
# if (( $? ));
# then
#     echo "NETCDF-C Configuration failed."
#     exit
# fi
# 
# make
# if (( $? ));
# then
#     echo "NETCDF-C Make failed."
#     exit
# fi
# 
# make install
# if (( $? ));
# then
#     echo "NETCDF-C Make install failed."
#     exit
# fi
# 
# make distclean
# if (( $? ));
# then
#     echo "NETCDF-C Make clean failed."
#     exit
# fi
# cd ../..

# Install CPP
cd netcdf-cxx4-${CPVER}
make distclean

if [ -d build ]; then
    rm -r build
fi
mkdir build && cd build

#CFLAGS='-m32' CPPFLAGS='-m32 -I/include -I/usr/include/i386-linux-gnu' \
#    LDFLAGS='-L/opt32/lib -L/usr/lib/i386-linux-gnu' \
CFLAGS='-m32' CPPFLAGS='-m32 -I/opt32/include ' \
    LDFLAGS='-L/opt32/lib ' \
    ../configure --prefix=/opt32 

if (( $? ));
then
    echo "NETCDF-CXX Configuration failed."
    exit
fi

make
if (( $? ));
then
    echo "NETCDF-CXX Make failed."
    exit
fi

make install
if (( $? ));
then
    echo "NETCDF-CXX Make install failed."
    exit
fi

make distclean
if (( $? ));
then
    echo "NETCDF-CXX Make clean failed."
    exit
fi
cd ../..


# Install Fortran part
cd netcdf-fortran-${FVER}
if [ -d build ]; then
    rm -r build
fi
mkdir build && cd build

CFLAGS='-m32' CPPFLAGS='-m32 -I/opt32/include' \
    FCFLAGS='-m32' FFLAGS='-m32' \
    LDFLAGS='-L/opt32/lib '\
    ../configure --prefix=/opt32 \
    --disable-fortran-type-check

#   LDFLAGS='-L/opt32/lib '\'-L/usr/lib/i386-linux-gnu' \

if (( $? ));
then
    echo "NETCDF-Fortran Configuration failed."
    exit
fi

make
if (( $? ));
then
    echo "NETCDF-Fortran Make failed."
    exit
fi

make install
if (( $? ));
then
    echo "NETCDF-Fortran Make install failed."
    exit
fi

make distclean
if (( $? ));
then
    echo "NETCDF-Fortran Make clean failed."
    exit
fi


