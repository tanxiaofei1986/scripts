#!/bin/bash

create_fio_auto() {

#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	echo "create fio task"
	./creat_fio_task.sh 4k read 512 &
	sleep 10
fi

}

create_fio_auto

for i in `seq 1 1000`
do
	#disable-enable local PHY
	for j in `seq 0 7`
	do
		echo "disable local phy$j"
		./phy_ops.sh close $j
		sleep 5
		echo "enable local phy$j"
		./phy_ops.sh open $j
		sleep 5
	done
	create_fio_auto

	#disable-enable local PHY using sysfs interface
	for j in `seq 0 7`
	do
		echo "disable phy$j"
		echo 0 > /sys/class/sas_phy/phy-0:$j/enable
		sleep 5
		echo "enable phy$j"
		echo 1 > /sys/class/sas_phy/phy-0:$j/enable
		sleep 5
	done
	create_fio_auto

	#hardreset local PHY
	for j in `seq 0 7`
	do
		echo "hardreset phy$j"
		echo 1 > /sys/class/sas_phy/phy-0:$j/hard_reset
		sleep 5
	done
	create_fio_auto

	#linkreset local PHY
	for j in `seq 0 7`
	do
		echo "linkreset phy$j"
		echo 1 > /sys/class/sas_phy/phy-0:$j/link_reset
		sleep 5
	done
	create_fio_auto

done

