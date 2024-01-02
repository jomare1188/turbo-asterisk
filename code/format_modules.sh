#!/bin/bash
#$ -q all.q
#$ -cwd
#$ -V
#$ -pe smp 1

IN_FILE=../results/Hoang2017_mcl_clusters.mcl
FORMATED_FILE=../results/Hoang2017_mcl_formated.mcl
CLUSTERS_SIZE=../results/Hoang2017_mcl_size.mcl

## GET SIZE IN EACH CLUSTER
awk -F' ' '{print NF}' $IN_FILE >  $CLUSTERS_SIZE

### REFORMAT MODULES OUTPUT
rm -f ../results/Hoang2017_mcl_formated.mcl
for i in $(seq 1 1 14350)
do
	sed -n "${i}p" $IN_FILE | awk -F" " -v c="$i" '{for(i=1; i<=NF; i++) {print $i,c}}' >> $FORMATED_FILE
done


