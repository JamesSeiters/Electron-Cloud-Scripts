#!/bin/bash

# Author: James Seiters
# Created: 2019/1/8
# Updated:
# Copyright: GPLv3
# Description: Will configure the live CD environment to install the operating system on a root ZFS file system. After the packages are
# installed, proper partitioning will be applied to allow booting from any of the installed drives. The root pool will be created from all
# available disk with the options specified.

################################################################################################################################################
# TODO:
# Create variables for:
#   pool name (can be host name)
#   root container name
#   root file-system name
#
################################################################################################################################################
