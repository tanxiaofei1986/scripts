#!/bin/bash

for i in `seq 0 1000`
do

./create_fio_task_auto.sh
sleep 10

./enject_ecc_error.sh lm_iost
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh lm_itct
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh rxm
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh hgc_iomb_itct
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh hgc_iomb_iost
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh hgc_iomb_cqe
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh hgc_iomb_dqe 
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh dmac_rx_rxm
sleep 1
./enject_ecc_error.sh close
sleep 30

./enject_ecc_error.sh dmac_tx_ram
sleep 1
./enject_ecc_error.sh close
sleep 30

done
