#!/bin/bash
#$ -q all.q
#$ -cwd
#$ -V
#$ -pe smp 50

module load miniconda3
conda activate DIAMOND
# usage qsub run_BLAST.sh db query out identity coverage

sugarcane_pantranscriptome_db=$1 # "../data/pan_db"
sugit_fa=$2 #"../data/sugit.fa"
blast_out=$3 # "../results/hoang_blast_pan_I20.tbl"
identity=$4
coverage=$5

blastn -db ${sugarcane_pantranscriptome_db} -query ${sugit_fa} -out $blast_out -outfmt "6 qseqid sseqid evalue bitscore score" -subject_besthit -perc_identity $identity -qcov_hsp_perc $coverage -num_threads $NSLOTS

