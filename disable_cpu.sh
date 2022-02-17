#!/bin/bash

# Turn off CPU throttling
sudo apt install cpufrequtils # If you do not have it installed
sudo cpufreq-set -g performance

