#! /bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./olog -e ./elog


mkdir -p ./count2/

num=$SGE_TASK_ID
file=`sed -n ${num}P ./sample_list.txt`
sfile=${file:0:7}

python count_exon.py refGene.merge.bed ./intersect2/i.${sfile} > ./count2/c.${sfile}




