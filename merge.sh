#!/bin/bash

ls CYP*vcf | sed 's/.vcf//' > haplotypes.txt

for i in $(cat haplotypes.txt); do
    bgzip ${i}.vcf
    tabix ${i}.vcf.gz
done

bcftools merge -m none *.vcf.gz > haplotypes.vcf 
