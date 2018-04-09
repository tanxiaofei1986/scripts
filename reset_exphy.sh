#!/bin/bash

for i in `seq 1 5000`
do 
	disks=`fdisk -l | grep "sd" | wc -l`
	echo "test times: $i!"
	echo 1 > /sys/class/sas_phy/phy-1\:$1\:0/hard_reset 
	sleep 3
	temp=`fdisk -l | grep "sd" | wc -l`
	if [ $temp != $disks ]; then
		echo "disk number from $disks to $temp"
		exit
	fi
done
