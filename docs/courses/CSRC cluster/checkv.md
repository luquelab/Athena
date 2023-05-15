---
layout: default
title: Submitting jobs on cinci cluster - CheckV 
nav_order: 3
parent: CSRC cluster
grand_parent: Lab Documentation
---

# Using qsub to submit bash scripts to run CheckV

The official README for CheckV can be found [here](https://bitbucket.org/berkeleylab/checkv/src/master/).

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
checkv end_to_end input_file.fna output_directory -d location_of_the_databse
~~~
The first line is the command which is used to change the current working directory in Linux. The second line is to enter the anaconda environment. The third line is to run CheckV using a single command to run the fill pipeline

Here is an example of how we can do it. 
~~~
checkv end_to_end ~/Test_CheckV/Test_sequence.fna ~/Test_CheckV/result -d /usr/local/checkv-db-v1.1
~~~

Another way to run CheckV using individual commands for each step in the pipeline
~~~
checkv contamination input_file.fna output_directory 
checkv completeness input_file.fna output_directory 
checkv complete_genomes input_file.fna output_directory
checkv quality_summary input_file.fna output_directory
~~~

You can now submit your script as a job using the command:
~~~
qsub checkv.sh
~~~

