#!/bin/bash

# Author: James Seiters
# Created: 2019/2/15
# Updated: 2019/2/17
# Copyright: GPLv3
# Description: A shell script to automate the repiar of ZFS backed VM disk.
#						  Created from instructions on https://ramsdenj.com/2016/07/21/
#						  making-a-zvol-backed-virtualbox-vm-on-linux.html

usage () {
	echo "Usage: $(basename $0)  [USERNAME] [TANK]"
	exit 1
}

# Standard sanity checks.
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run with root privileges."
	exit 2
fi

[[ $# -ne 2 ]] && usage

# Set variables
username=$1
tank=$(zfs list -r $2 -o name -H) || usage

# Main logic
counter=0

for  vmhostname in $tank; do
	if [[ counter -ne 0 ]]; then
		chown $username:disk /dev/zvol/$vmhostname
		echo "KERNEL==\"zd*\" SUBSYSTEM==\"block\" ACTION==\"add|change\""\
		"PROGRAM=\"/lib/udev/zvol_id /dev/%k\" RESULT==\"$vmhostname\""\
		"OWNER=\"$username\" GROUP=\"disk\" MODE=\"0750\"" >> \
		/etc/udev/rules.d/99-local-zvol.rules
	fi
	((counter++))
done

udevadm control --reload
echo "Processed $counter files."
exit 0
