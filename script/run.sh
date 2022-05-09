#!/bin/bash
rm -rf output 
mkdir -p output

echo $(pwd)

for i in 4 2 1; do
    command="docker run --env OMP_NUM_THREADS=1 --rm --network=host -v=$(pwd):/root dist_dcgan:latest python -m torch.distributed.launch --nproc_per_node=$i --nnodes=1 --node_rank=0 --master_addr="172.17.0.1" --master_port=1234 dist_dcgan.py --dataset cifar10 --dataroot ./cifar10 --num_epochs 1"
    for j in `seq 1 3`; do 
        $command | grep 'Epoch 0 took' >> ./output/result_$i.out; 
        echo "=======================" >> ./output/result_$i.out;
    done
done