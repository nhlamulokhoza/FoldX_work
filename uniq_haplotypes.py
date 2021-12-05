#!/usr/bin/env python3

import os
import sys

f = open('haplotypes.txt', 'r')

hap_names = []
data = []
uniq_names = []

for line in f:
    line = line.strip()
    hap_names.append(line)

for elem in hap_names:
    g = open(elem, 'r')
    
    for line in g:
        line = line.strip()[:-1].split(',')
        
        if line in data:
            pass
        else:
            data.append(line)
            uniq_names.append(elem)


for f_name in uniq_names:
    index1 = uniq_names.index(f_name)
    f_name1 = 'individual_' + f_name  
    m = open(f_name1, 'w')
    m.write(",".join(data[index1]))
