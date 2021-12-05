#!/usr/bin/env python3

import os
import sys


#total_l = sys.argv[1]
#hap = sys.argv[2]

infile=sys.argv[1]


list1 = infile.split('_')

hap = list1[2:]

hap = "_".join(hap)[:-4]

for line in open(infile, 'r'):
    line = line.strip()

    if line.startswith('Total'):

        index1 = line.find('=')
        total = line[index1+1:]
        result = hap + '\t' + total
        print(result)
#print(hap)
#print(hap + "\t" + total)
