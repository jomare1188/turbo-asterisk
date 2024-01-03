# Case study for conekt-grasses
```sh
/Storage/data1/jorge.munoz/HOANG_NETWORK
```
We are based on the findings made in "Association of variation in the sugarcane transcriptome with sugar content." BMC genomics 18 (2017): 1-22. (Thirugnanasambandam, Prathima P., et al. 2017).
The study successfully identified a significant number of genes that potentially contribute to sucrose accumulation using RNA-Seq analysis in high and low sugar genotypes as well as mature and immature culm tissues

Here we want to show the potential of Conekt Grasses to make co-expression network analyisis, to do this we are going to look for some DEGs metioned by (Thirugnanasambandam, Prathima P., et al. 2017) and we are going to see in which modules of the network they are located, which will allow us to ask questios like is that module enriched in which functions?, is there a module enriched in those DEGs? how is the expression pattern of the neighbors/modules of the DEGs?, which we will approach using conekt.

Since RNA-seq data from (Thirugnanasambandam, Prathima P., et al. 2017), was quantified using three different references: 
1) SAS (sugarcane assembled sequences) from sugarcane EST database (SUCEST)
2) SoGI (Saccharum officinarum Gene Index, 3.0),
3) SUGIT a sugarcane Iso-Seq transcriptome database, 

We used as example 21 DEGs (contrast HSTvsHSB)  SUGIT db (HSTvsHSB). We need to know which transcripts match with the Sugar-cane Pantranscriptome used as reference in conekt Grasses. This is done by run_BLAST.sh.

We made a parameter search for the blast and finally we decided to stay with -qcov_hsp_perc 98% and -perc_identity 98%. Since pan-transcriptome sequences are way larger than the SUGIT sequences so we expect a high coverage (see histograms in results),  100% of identity throw very few matchs so we set identity in 98%, "accounting" for possible sequencing errors. 
We were able to identift 67205/107598 sequencs from sugit in the Sugar-cane pantranscriptome.

see hoang_blast_pan_I98_C98.tbl compare_seqs_lengts.r, histogram_SC-PAN.png and histogram_SUGIT.png for more details about the parameter search.

next using  the HCCA clustering provided by CoNekT Grasses clusters_hoang2017.txt we for DEGs in the network
```sh
grep -f SUIGT_DEGs_HSTvsHSB.txt hoang_blast_pan_I98_C98.tbl | cut -f2 | xargs -I{} grep {} clusters_hoang2017.txt > HCCA_HSTvsHSB.txt
```
5/6 DEGs were found in the same module.

Now using mcl to make the clusters of the network, run_mcl.sh run mcl for you, it uses i=1.8
Next we would like the modules generated by mcl in such form: transcript_id   module. We use format_modules.sh for this pourpuse
Now we can use:
```sh
grep -f SUIGT_DEGs_HSTvsHSB.txt hoang_blast_pan_I98_C98.tbl | cut -f2 | xargs -I{} grep {} Hoang2017_mcl_formated.mcl
```
10 from 29 genes were found in the module 3 from mcl clustering.

It worths to go further in this modules and make use other tools like functional enrichment and to investigate expression patterns using heatmap visualization.
