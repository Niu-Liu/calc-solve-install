#!/bin/bash
#########################################################################
# File Name: intel.sh
# Author: Neo
# mail: niu.liu@nju.edu.cn
# Created Time: Thu 15 Apr 2021 03:21:16 PM CST
#########################################################################

# use wget to fetch the Intel repository public key
cd /tmp
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# add to your apt sources keyring so that archives signed with this key will be trusted.
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
# remove the public key
rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

# Configure the APT client to use Intel's repository
sudo add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"

sudo apt update

# Install the desired package
sudo apt install intel-basekit
sudo apt install intel-basekit-32bit
sudo apt install intel-hpckit
sudo apt install intel-hpckit-32bit

