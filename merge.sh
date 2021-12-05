#!/bin/bash

ls CYP*vcf | sed 's/.vcf//' > haplotypes.txt               # List all vcfs and redirect into haplotype.txt -- Each vcf corresponds to a haplotype

for i in $(cat haplotypes.txt); do                         # Compress and index vcf files listed in haplotype.txt
    bgzip ${i}.vcf
    tabix ${i}.vcf.gz
done

bcftools merge -m none *.vcf.gz > haplotypes.vcf           # Merge all compressed and indexed vcfs into one -- preparation for VeP
