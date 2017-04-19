#! /bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./olog -e ./elog


mkdir -p ./intersect2/

num=$SGE_TASK_ID

file=`sed -n ${num}P ./sample_list.txt`
sfile=${file:0:7}

bedtools intersect -abam ./data/$file -b ./refGene.merge.bed -wo -bed > ./intersect2/i.${sfile}




