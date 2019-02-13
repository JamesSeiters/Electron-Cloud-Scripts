#!/bin/bash

# Author: James Seiters
# Created: 2018/12/4
# Updated:
# Copyright: GPLv3
# Description: A shell script to automate the installation of Wine on test
#              systems. This should only be run on new systems.
#              Created from instructions on https://wiki.winehq.org/Ubuntu
# Usage: install-wine
# if wget -nc https://dl.winehq.org/wine-builds/Release.key; then
#   sudo apt-key add Release.key &&
#   sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
# fi
#
# sudo apt-get install --install-recommends winehq-stable


wget -nc https://dl.winehq.org/wine-builds/Release.key &&
sudo apt-key add Release.key &&
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ &&
sudo apt-get install --install-recommends winehq-stable
