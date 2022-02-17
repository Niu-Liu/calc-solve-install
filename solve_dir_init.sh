#!/bin/bash
#########################################################################
# File Name: solve_dir_init.sh
# Author: Neo
# mail: liuniu@smail.nju.edu.cn
# Created Time: Tue 15 Sep 2020 04:05:06 PM CST
#########################################################################

# Creat root directory
mk5_root=~/mk5
mkdir ${mk5_root}

# Sub-directories
subdir=("archive" "save" "work" "spool" "cat" "apriori" "log" "delog" "sked" \
    "phase" "database" "super")

# Create these sub-directories
for dir in ${subdir[@]}; do
    mkdir ${mk5_root}/${dir}
done
