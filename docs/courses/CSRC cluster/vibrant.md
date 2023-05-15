---
layout: default
title: Submitting jobs on cinci cluster - VIBRANT 
nav_order: 4
parent: CSRC cluster
grand_parent: Lab Documentation
---

# Using qsub to submit bash scripts to run VIBRANT

The official README for CheckV can be found [here](https://github.com/AnantharamanLab/VIBRANT).

For this code to run we are assuming that you have bashrc-ana3.bashrc in your home directory.

~~~
#!/bin/bash
#PBS -l nodes=2:ppn=24
#PBS -l walltime=02:00:00
~~~

The first line us the most common shell used as default shel for user login of the linux system. It is used to instruct the operating system to use bash as a command interpreter. The second ans third lines request resources for the job. This job requests two nodes with 24 ppn (processors per node). This combination would run the job using two of the 12 core 24 thread CPUs on the cinci cluster.

~~~
cat ${PBS_NODEFILE} 
~~~
The nodefile contains a list of all nodes the job has allocated with an entry for every CPU.

~~~
cd 
source bashrc-ana3
cd ../../usr/local/VIBRANT-1.2.1/
python3 VIBRANT_run.py -i input_file.fna -folder output_directory
~~~
The first line is the command which is used to change the current working directory in Linux. The second line is to enter the anaconda environment. The third line is to go to the directory where VIBRANT is installed. The fourth line is to run VIBRANT using python3.

Here is an example
~~~
python3 VIBRANT_run.py -i ~/Test_VIBRANT/DTRs_ctgs_1-10.fna -folder ~/Test_VIBRANT/Test_results
~~~

you can now submit your script as a job using the command:

~~~
qsub vibrant.sh
~~~

