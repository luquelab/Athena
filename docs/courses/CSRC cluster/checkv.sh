#!/bin/bash
#PBS -l nodes=2:ppn=24
#PBS -l walltime=02:00:00

echo "Running on: "
cat ${PBS_NODEFILE}  # The nodefile contains a list of all nodes the job has allocated with an entry for every CPU

echo
echo "Program Output begins: "

cd  # going into the home directory
source bashrc-ana3  # entering the anaconda environment
checkv end_to_end ~/Test_CheckV/Test_sequence.fna ~/Test_CheckV/result -d /usr/local/checkv-db-v1.1

# checkv end_to_end input_file.fna output_directory -d location_of_the_databse
