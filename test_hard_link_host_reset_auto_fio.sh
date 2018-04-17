#!/bin/bash
for i in `seq 1 1000`
do
#disable-enable PHY
	for j in `seq 0 11`
	do
		echo "disable begin $j"
		echo 0 > /sys/class/sas_phy/phy-0:0:$j/enable
		sleep 5
		echo "enable begin $j"
		echo 1 > /sys/class/sas_phy/phy-0:0:$j/enable
		sleep 5
	done
#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	./creat_fio_task.sh 4k read 512 &
fi
sleep 10

#hardreset PHY
	for j in `seq 0 11`
	do
		echo "hardreset begin $j"
		echo 1 > /sys/class/sas_phy/phy-0:0:$j/hard_reset
		sleep 5
	done
#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	./creat_fio_task.sh 4k read 512 &
fi
sleep 10

#linkreset PHY
	for j in `seq 0 11`
	do
		echo "linkreset begin $j"
		echo 1 > /sys/class/sas_phy/phy-0:0:$j/link_reset
		sleep 5
	done
#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	./creat_fio_task.sh 4k read 512 &
fi
sleep 10

	echo "reset host $i"
	#echo "adapter" > /sys/devices/platform/HISI0162\:01/host1/scsi_host/host1/host_reset
	echo "adapter" > /sys/class/scsi_host/host0/host_reset
	sleep 20
done

for i in `seq 1 10`
do
	echo "reset host $i"
	#echo "adapter" > /sys/devices/platform/HISI0162\:01/host1/scsi_host/host1/host_reset
	echo "adapter" > /sys/class/scsi_host/host0/host_reset
	sleep 20
done
