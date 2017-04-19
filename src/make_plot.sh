#! /bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./olog -e ./elog


mkdir -p ./plot/

num=$SGE_TASK_ID


file=`sed -n ${num}P ./list_short.txt`

R --vanilla make_plot.R ./result2/r.${file} ./plot/${file}.png


