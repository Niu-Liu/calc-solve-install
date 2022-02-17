#!/bin/bash
#########################################################################
# File Name: calc_solve_install.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Tue 15 Sep 2020 04:04:44 PM CST
#########################################################################

# Install gfortran
sudo apt-get install gfortran-multilib

# Install zlib
sudo apt install zlib1g:i386
sudo apt install libsnappy-dev:i386
sudo apt install liblz4-1:i386

# Libpng & libjpeg
sudo apt install libpng-dev libpng-dev:i386  libjpeg-dev:i386

# Curses
sudo apt-get install libncurses5 libncurses5:i386 libncurses5-dev libncurses5-dev:i386

# X11
sudo apt-get install libx11-6 libx11-dev libx11-6:i386 libx11-dev:i386

# rpc
sudo apt install libntirpc-dev

# Mail client
sudo apt install mailutils

# Unzip the .tar file
# cd ~/mk5/archive
# tar -xvf ~/softwares/incoming/SOLVE_mk5_20200123.tar 
