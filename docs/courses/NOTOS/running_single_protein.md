---
layout: default
title: Running a single protein structure on Alphafold
nav_order: 2
parent: Alphafold on Notos server 
grand_parent: Lab Documentation
has_children: false
---

# Predicting a single protein structure using Alphafold on Notos 

### Setup
1. Copy the alphafold folder from /mnt/beegfs/alphafold/alphafold to your home directory
    * When you log in to notos you are automatically in your home directory
    * Run the command below to copy the folder into your home directory
    * ``` cp -r /mnt/beegfs/alphafold/alphafold/ . ``` 
    * This folder has all the required updates to run alphafold successfully
2. Locate the folder named docker by running the command ``` cd alphafold/docker ``` 
3. Open run_docker.py by running the command ``` vi run_docker.py ```
    * Press i to insert and make edits to the file
    * Change the destination folder output_dir on line 49 to a folder you wish the results are saved into
    * Make sure you have sufficient read and write permissions for the output_dir folder

### Running Alphafold
1. To run alphafold, go back to the home directory by running the command ``` cd ``` 
2. Type the command ``` python3 ~/alphafold/docker/run_docker.py   --fasta_paths=path_to_sequence  --max_template_date=YYYY-MM-DD    --data_dir=/mnt/beegfs/alphafold/databases ```
    * For example: ``` python3 ~/alphafold/docker/run_docker.py --fasta_paths=T1050.fasta --max_template_date=2020-05-14 --data_dir=/mnt/beegfs/alphafold/databases ```
    * For optimized performance use the preset reduced_dbs. For example: ``` python3 ~/alphafold/docker/run_docker.py --fasta_paths=T1050.fasta --max_template_date=2020-05-14 --model_preset=monomer --db_preset=reduced_dbs --data_dir=data_dir=/mnt/beegfs/alphafold/databases ```
    * You can use the date variable for the max_template_date by running the command ```today = `date +%Y-%m-%d` ``` and setting max_template_date to ``` max_template_date = $today ```
3. Other presets and options can be found [here](https://luquelab.github.io/Athena/courses/NOTOS/alphafold.html)

## Using a GNU screen
To be able to detach and disconnect from a process without interrupting the procedure use GNU screen sessions: 

1. Follow the setup process above
2. To start a named screen session, type the following in your console ```screen -S session_name  ```
3. Run the required alphafold commands
4. To detach from a linux screen session, press ``` Ctrl+a d ```
5. To get the list of current running sessions, type the following ``` screen -ls ```
6. To reattach to a linux screen, type the following ``` screen -r session_name```
7. More on GNU screen sessions can be found [here](https://linuxize.com/post/how-to-use-linux-screen/).

