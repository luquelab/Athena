---
layout: default
title: Job Submission on Cinci 
nav_order: 1
parent: CSRC cluster
grand_parent: Lab Documentation
---

# Job Submission on Cinci 

The Cinci server used at the Luque Lab uses PBS (Portable Batch System) Torque which is a resource management system for submitting and controlling jobs on supercomputers, clusters and grids. 

The Cinci server has 20 compute nodes - node 1 through node 20 amongst which 4 are higher performance/memorgy compute nodes - node 17 through node 20. Nodes 1 through 16 have 16 processors each and nodes 17 through 20 have 24 processors each. 

Job submission is accomplished using the qsub command. The PBS command file is specified as a filename on the qsub command line. Once we submit a script via qsub which is then sent to the scheduling system. The scheduler will then find free resources and run the script on an available node.

The resource requests can be made using either the script or command line arguments.

**Using command line**:


```bash
qsub -l nodes=16
```
 Specifies that we are requesting 16 nodes of any type. If the number of nodes are not specified 1 node is taken. 

 
```bash
qsub -l nodes=16:ppn=24
```
Specifies that we are requesting 24 processors on each of the 16 nodes

```bash
qsub -l nodes=1:ppn=1,pmem=100MB,walltime=5:00
```
Specifies that we are requestion one node, one processor on that node, 100 mega bytes per process and a walltime of five minutes. 

**Using scripts**:

```bash
#PBS -N Name 
#PBS -l nodes=1:ppn=1,walltime=01:00

echo "Hello World"
```
Here we are giving a job name, specifying that we need one processor on 1 node for 1 minute. 


A list of other arguments and commands can be found [here](https://www.cqu.edu.au/eresearch/high-performance-computing/hpc-user-guides-and-faqs/pbs-commands).

**Monitoring Jobs**

The qstat command is used to monitor submitted jobs. 

```bash
qstat -f 
```
Specifies that a full status display be written to standard out. The [time] value is the amount of walltime, in seconds, remaining for the job.

More qstat options can be found [here](http://docs.adaptivecomputing.com/torque/3-0-5/commands/qstat.php).


**Canceling Jobs**

Submitted jobs can be cancelled using the qdel command. The only parameter is the ID of the job to be canceled. For example if we want to kill the job with an ID 314

```bash
qdel 314
```

To delete all the the jobs
```bash
qdel all
```

More qdel options can be found [here](http://docs.adaptivecomputing.com/torque/3-0-5/commands/qdel.php).
