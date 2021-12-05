#!/bin/bash -l

#SBATCH -J HapPrep
#SBATCH -e errors_%j.txt                                                                                  
#SBATCH -c 4                                                                                        
#SBATCH --mem=20000

for i in $(cat haplotypes.txt); do

bcftools isec -p ${i}_dir ${i}.vcf.gz missense.vcf.gz

if [[ $(grep -v '#' ${i}_dir/0000.vcf | grep '.') ]]; then
:
else
        cut -f 8 ${i}_dir/0003.vcf | grep -v '#' | grep -v INFO | cut -d '|' -f 15-16 | sed 's/|/\t/' | sed 's/\//\t/' | awk 'BEGIN {OFS=""} {print $2,$1,$3}' | sed -z 's/\n/,/g' > list_${i}.txt
fi

rm -rf ${i}_dir
 
done
