#! /bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./olog -e ./elog

ls ./data/*bam | xargs -i basename {} > ./sample_list.txt
sed -e 's/[T|N].markdup.bam//g' ./sample_list.txt | sort | uniq > list_short.txt

allnum=`grep '' ./sample_list.txt | wc -l`
halfnum=$((allnum/2))

qsub -N job1 -t 1-$allnum:1 ./intersect.sh

qsub -N job2 -hold_jid job1 -t 1-$allnum:1 ./count_exon.sh

qsub -N job3 -hold_jid job2 -t 1-$halfnum:1 ./make_ratio.sh

qsub -N job4 -hold_jid job3 -t 1-$halfnum:1 ./make_plot.sh

