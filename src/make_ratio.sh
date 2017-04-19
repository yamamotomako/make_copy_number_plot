#! /bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./olog -e ./elog


mkdir -p ./result2/

num=$SGE_TASK_ID


file=`sed -n ${num}P ./list_short.txt`


python make_ratio.py ./count2/c.${file}N ./count2/c.${file}T > ./result2/r.${file}





