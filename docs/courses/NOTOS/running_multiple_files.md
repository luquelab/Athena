---
layout: default
title: Running multiple protein strctures on Alphafold
nav_order: 3
parent: Alphafold on Notos server 
grand_parent: Lab Documentation
has_children: false
---

# Predicting multiple protein structures using Alphafold on Notos 

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

### Running multiple files on Alphafold in series on a single GPU
1. Create a folder with all the sequences you want to run on a single GPU 
2. Check the status of the GPU's by running the command ``` nvidia-smi ```
3. cd into your home directory using the command ``` cd ``` 
4. Locate and enter the folder GPU_scripts by running the command ``` cd alphafold/GPU_scripts ``` 
5. List contents in the folder by using the command ``` ls ```. The folders are named ```GPU_[GPU_number].sh ```. Choose the GPU number which isn't being used (Following step 2)
6. Start a named screen session, by typing the following in your console ```screen -S session_name ``` 
7. Run the following command to run the sequences on a single GPU 

    ``` bash GPU_[GPU_number].sh path_to_the_folder_with_sequences```

    For example, if you want to run the sequences on GPU number 6: ``` bash GPU_6.sh ~\sequences\test_folder\``` where ``` ~\sequences\test_folder\``` is the folder with sequences. 
    
    - These scripts run alphafold using full databases. For optimized performance use the preset reduced_dbs. Open the GPU_[number] script and add the preset ``` --db_preset=reduced_dbs``` to line 9
    - Other presets and options can be found [here](https://luquelab.github.io/Athena/courses/NOTOS/alphafold.html)
8. Detach from the linux screen session, by press ``` Ctrl+a d ```
    - To get the list of current running sessions, type the following ``` screen -ls ```
    - To reattach to a linux screen, type the following ``` screen -r session_name```

### Running multiple files on Alphafold in series on a multiple GPUs
1. Create seperate folders for each set of sequences you want to run on the GPUs
2. Repeat steps 2 to 8 for each of the folders on seperate GPUs
