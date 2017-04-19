import os
import sys
import re

normal_count = sys.argv[1]
tumor_count = sys.argv[2]

output_dict = {}

with open(normal_count, "r") as f:
	#lines = f.read().strip().split("\n")
	for line in f:
		arr = line.strip().split("\t")
		r = re.compile("[\d|X|Y]")
		m = r.search(arr[0])
		if m == None:
			continue
		if int(arr[3]) < 20:
			continue

		target = arr[0] + "_" + arr[1] + "_" + arr[2]
		output_dict[target] = [arr[3],"",""]


with open(tumor_count, "r") as f:
	#lines = f.read().strip().split("\n")
	for line in f:
		arr = line.strip().split("\t")
		r = re.compile("[\d|X|Y]")
		m = r.search(arr[0])
		if m == None:
			continue

		target = arr[0] + "_" + arr[1] + "_" + arr[2]
		if target in output_dict:
			normal_depth = output_dict[target][0]
			output_dict[target][1] = arr[3]
			output_dict[target][2] = str('%05.5f' % (float(int(arr[3])) / int(normal_depth)))


header = ["chr","start","end","normal_depth","tumor_depth","ratio"]
result = "\t".join(header) + "\n"

for k,v in output_dict.items():
	target = k.split("_")
	arr = [target[0], target[1], target[2], v[0], v[1], v[2]]
	result += "\t".join(arr) + "\n"

result = result.strip()
print result

sys.exit()



