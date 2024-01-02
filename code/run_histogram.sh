#!/bin/bash
#$ -q all.q
#$ -cwd
#$ -V
#$ -N histogram
#$ -pe smp 1
module load R/4.0.0
Rscript compare_seqs_lengts.r "/Storage/data1/jorge.munoz/DOLORES/quant_test/protein_coding_transcripts/data/transcripts_in_orthogroups.ids.fasta" "../results/histogram_SC-PAN.png" "SC-PAN sequence lenght distribution"
