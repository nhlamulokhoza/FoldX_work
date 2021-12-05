# FoldX_work
Preparing .vcf files, running FoldX and manipulating the results

This repo makes use of different script, all seeking to prepare .vcf files, creating .txt input files for FoldX (containing multiple variants/haplotypes), running FoldX, and sorting and putting the results (energy of folding) in a table.

******Instructions:******

There are five scripts:


merge.sh

This script compresses, indexes, and merges all .vcfs into one larger .vcf. The larger .vcf file will be the input for Ensembl's variant effect predictor (VeP).

Run_VeP.sh

Alternatively, one may choose not to run this script but the web interface of VeP and would not be required to run this script, provided that they filter for missense variants.

HapPrep.sh

Produces file 'list_${i}.txt', the input for the next script.

uniq_haplotypes.py

Keeps only the unique haplotypes and renames them 'individual_list_${I}.txt' -- the input for FoldX

RunFoldX.sh

Runs FoldX and redirects them into Results directory. Kindly move into Results folder.

list_energies.py

List FoldX scores for all haplotypes in a newly created FoldX_scores.txt
