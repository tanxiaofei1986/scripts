#!/bin/sh

counter=0

while [ 1 ]
do
	
echo "adapter" > /sys/devices/platform/HISI0162\:01/host1/scsi_host/host1/host_reset

counter=`expr $counter + 1`
echo "reset times $counter"

sleep $1

done

