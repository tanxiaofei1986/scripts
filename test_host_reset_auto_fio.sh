#!/bin/bash
for i in `seq 1 1000`
do
#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	./creat_fio_task.sh 4k read 512 &
	sleep 10
fi

echo "reset host $i"
echo "adapter" > /sys/class/scsi_host/host0/host_reset
sleep 20

done

