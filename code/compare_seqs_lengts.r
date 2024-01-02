library(seqinr, lib.loc="/Storage/data1/jorge.munoz/NRGSC.new/libraries")
library(ggplot2, lib.loc="/Storage/data1/jorge.munoz/NRGSC.new/libraries")
# Rscript compare_seqs_lengts.r fasta_in out_file title

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) {
  stop("Please provide three arguments: fasta_file, output_file, and graph title")
}

in_fasta=args[1]
out_file=args[2]
title=args[3]


# Read the FASTA file
fasta_file <- read.fasta(in_fasta)

# Extract sequence lengths
seq_lengths <- lengths(fasta_file)

df <- as.data.frame(seq_lengths)

ggplot(df, aes(seq_lengths)) +
    geom_histogram(bins = 400, alpha = 0.5) +
    labs(title = title, x = "Lenght", y = "Frequency")+
    theme_bw()+
    xlim(0, 10000)

ggsave(out_file, width = 6, height = 4)


