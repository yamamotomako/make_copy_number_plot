#! /usr/bin/env python

import sys
import os

ref_file = sys.argv[1]
intersect_file = sys.argv[2]
#out_file = sys.argv[3]

ref_dict = {}

with open(ref_file, "r") as f:
	for line in f:
		arr = line.strip().split("\t")
		arr.append(int(0))
		ref_dict[arr[1]+"_"+arr[2]] = arr



#ref_dict = sorted(ref_dict.items(), key=lambda x: x[0])

with open(intersect_file, "r") as g:
	for line in g:
		arr = line.strip().split("\t")
		pos = arr[13]+"_"+arr[14]
		
		if pos in ref_dict:
			ref_dict[pos][3] += 1



result = ""
for key, value in ref_dict.items():
	if value[3] != 0:
		result += "\t".join([str(x) for x in value]) + "\n"

print result


sys.exit()



