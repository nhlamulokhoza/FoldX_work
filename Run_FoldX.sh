#!/bin/bash -l

#SBATCH -J HapFoldX
#SBATCH -e errors_%j.txt                                                                                  
#SBATCH -c 4                                                                                        
#SBATCH --mem=20000

ls individual_list* > haplotypes.txt

mkdir Results
for i in $(cat haplotypes.txt); do
      foldx --command=BuildModel --pdb=./CYP2A13_Repair.pdb --mutant-file=${i} > Results/${i}
done

