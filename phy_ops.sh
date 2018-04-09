#!/bin/bash

if [ $1 = "close" ];then
	if [ $2 = 0 ];then
		devmem 0xa2002000 w 0x6
	fi	
	if [ $2 = 1 ];then
		devmem 0xa2002400 w 0x6
	fi
	if [ $2 = 2 ];then
		devmem 0xa2002800 w 0x6
	fi	
	if [ $2 = 3 ];then
		devmem 0xa2002c00 w 0x6
	fi	
	if [ $2 = 4 ];then
		devmem 0xa2003000 w 0x6
	fi	
	if [ $2 = 5 ];then
		devmem 0xa2003400 w 0x6
	fi
	if [ $2 = 6 ];then
		devmem 0xa2003800 w 0x6
	fi	
	if [ $2 = 7 ];then
		devmem 0xa2003c00 w 0x6
	fi	
	if [ $2 = "all" ];then
		devmem 0xa2002000 w 0x6
		devmem 0xa2002400 w 0x6
		devmem 0xa2002800 w 0x6
		devmem 0xa2002c00 w 0x6
		devmem 0xa2003000 w 0x6
		devmem 0xa2003400 w 0x6
		devmem 0xa2003800 w 0x6
		devmem 0xa2003c00 w 0x6
	fi
fi
if [ $1 = "open" ];then
	if [ $2 = 0 ];then
		devmem 0xa2002000 w 0x7
	fi	
	if [ $2 = 1 ];then
		devmem 0xa2002400 w 0x7
	fi
	if [ $2 = 2 ];then
		devmem 0xa2002800 w 0x7
	fi	
	if [ $2 = 3 ];then
		devmem 0xa2002c00 w 0x7
	fi	
	if [ $2 = 4 ];then
		devmem 0xa2003000 w 0x7
	fi	
	if [ $2 = 5 ];then
		devmem 0xa2003400 w 0x7
	fi
	if [ $2 = 6 ];then
		devmem 0xa2003800 w 0x7
	fi	
	if [ $2 = 7 ];then
		devmem 0xa2003c00 w 0x7
	fi	
	if [ $2 = "all" ];then
		devmem 0xa2002000 w 0x7
		devmem 0xa2002400 w 0x7
		devmem 0xa2002800 w 0x7
		devmem 0xa2002c00 w 0x7
		devmem 0xa2003000 w 0x7
		devmem 0xa2003400 w 0x7
		devmem 0xa2003800 w 0x7
		devmem 0xa2003c00 w 0x7
	fi
fi

addr=`printf %d 0xa2002204`
chn_died_num=0

for j in $(seq 0 7)
do
	addr16=`printf 0x%x $addr`
	dma_tx_dfx1=`devmem $addr16 w`
	let "$dma_tx_dfx1 & 0x4000000"
	if [ ! $? ]; then
		echo "channel $j died."
		chn_died_num=`expr $chn_died_num + 1`
	fi
	addr=`expr $addr + 1024`
done

if [ $chn_died_num = 8 ]; then
	echo "#######################"
	echo "    dmac died now!     "
fi
