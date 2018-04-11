#!/bin/bash

#detect whether all fio are closed
num=`ps -ef | grep fio | wc -l`
echo $num
if [ $num -le 4 ];then
	echo "create fio task"
	./creat_fio_task.sh 4k read 512 &
fi


