#!/bin/bash
#PBS -l nodes=1:ppn=24
#PBS -l walltime=02:00:00

cd ~/Test_VIBRANT # cd into the directory with the test file
echo
echo "Program Output begins: "

head -10 DTRs_20kb.fna | tail -10 > DTRs_ctgs_1-10.fna;
head -20 DTRs_20kb.fna | tail -10 > DTRs_ctgs_11-20.fna;
head -30 DTRs_20kb.fna | tail -10 > DTRs_ctgs_21-30.fna;
head -40 DTRs_20kb.fna | tail -10 > DTRs_ctgs_31-40.fna;
head -50 DTRs_20kb.fna | tail -50 > DTRs_ctgs_41-50.fna;


cd  # going into the home directory
source bashrc-ana3  # entering the anaconda environment

cd ../../usr/local/VIBRANT-1.2.1/

echo "Running VIBRANT"

python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_1-10.fna -folder ~/Test_VIBRANT/Test_results
python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_11-20.fna -folder ~/Test_VIBRANT/Test_results
python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_21-30.fna -folder ~/Test_VIBRANT/Test_results
python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_31-40.fna -folder ~/Test_VIBRANT/Test_results
python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_41-50.fna -folder ~/Test_VIBRANT/Test_results



