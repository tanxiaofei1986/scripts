#!/bin/bash

ifconfig eth0 192.168.1.177
ping 192.168.1.107 -n 4

#promote prio to highest
echo 8 > /proc/sys/kernel/printk
cat /proc/sys/kernel/printk
mount /dev/sda1 /mnt

#read big data
echo "read big data begin!"
./creat_fio_task.sh 1m read 128
echo "read big data end!"

#read small data
echo "read small data begin!"
./creat_fio_task.sh 4k read 32
echo "read small data end!"

#write big data
echo "write big data begin!"
./creat_fio_task.sh 1m write 128
echo "write big data end!"

#write small data
echo "write small data begin!"
./creat_fio_task.sh 4k write 32
echo "write small data end!"


#rw big data
echo "rw big data begin!"
./creat_fio_task.sh 1m rw 128
echo "rw big data end!"

#rw small data
echo "rw small data begin!"
./creat_fio_task.sh 4k rw 32
echo "rw small data end!"



