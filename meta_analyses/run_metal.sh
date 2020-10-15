#!/bin/bash

# specificy shell to interpret the job script
#$ -S /bin/bash

# Redirect output and error to this location
#$ -o /genetics/data/GWA/metabolomics/biocrates_fenland/03_ma_overall/output
#$ -e /genetics/data/GWA/metabolomics/biocrates_fenland/03_ma_overall/output

#Set name of job
#$ -N run_metal

#send status information to this email address.
#$ -M Isobel.Stewart@mrc-epid.cam.ac.uk

#send an email when the job is done.
#$ -m e

#specify queue - you check what queues are available with qconf -sql.  qconf -sq <queue name> will give you details of the queue
#$ -q all.q

export DIR=/genetics/data/GWA/metabolomics/biocrates_fenland/03_ma_overall/

MET="$(cat $DIR/metabolite_list_groups145.txt | head -n ${SGE_TASK_ID} | tail -n 1 )"

/genetics/bin/metal < $DIR/script_metal_${MET}.txt > $DIR/metan_results/${MET}.log

gzip -f $DIR/metan_results/${MET}_pval1.txt
