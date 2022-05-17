#!/bin/bash

#Arguments
MASTER_IP="$1"
RANK=$2
N_NODE=$3

#Change to the root directory
cd ../..

#Run Docker
sudo docker run --user=$(id -u):$(id -g) --env OMP_NUM_THREADS=1 --rm --network=host -v=$(pwd):/root dist_dcgan:latest python -m torch.distributed.launch --nproc_per_node=1 --nnodes=$N_NODES --node_rank=$RANK --master_addr=$MASTER_IP --master_port=1234 dist_dcgan.py --dataset cifar10 --dataroot ./experiments/ativ-6-exp-1/input/