#!/bin/bash
#$ -cwd
#$ -
#$ -q all.q
#$ -pe smp 40

module load mcl/14-137

in=../data/Hoang2017_mcl_out.txt
out=../data/Hoang2017_mcl_clusters.mcl


mcl $in -I 1.8 -te 40 --abc -o $out 
