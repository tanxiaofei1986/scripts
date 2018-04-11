#!/bin/bash

if [ $# = 1 ]; then
	if [ $1 = "close" ] ;then
		devmem 0xa20001f0 32 0
		devmem 0xa2000200 32 0
		exit
	fi

	if [ $1 = "lm_iost" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x1E00000
		exit
	fi

	if [ $1 = "lm_itct" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x1E0000
		exit
	fi

	if [ $1 = "rxm" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x1E000
		exit
	fi

	if [ $1 = "hgc_iomb_itct" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x1E00
		exit
	fi

	if [ $1 = "hgc_iomb_iost" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x1E0
		exit
	fi

	if [ $1 = "hgc_iomb_cqe" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x10
		exit
	fi

	if [ $1 = "hgc_iomb_dqe" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0xF
		exit
	fi

	if [ $1 = "dmac_rx_rxm" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000200 32 0x2AAAA
		exit
	fi

	if [ $1 = "dmac_tx_ram" ] ;then
		devmem 0xa20001f0 32 3
		devmem 0xa2000204 32 0x15555
		exit
	fi
fi


