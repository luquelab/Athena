---
layout: default
title: Lab GitHub Backup  
nav_order: 7
parent: GitHub for Luque Lab
grand_parent: Lab Documentation
---
# Manual Github Backup

The [Luque lab](https://www.luquelab.com/team.html) follows the 3-2-1 backup strategy for backing up all lab-related data. This strategy states that you should have 3 copies of your data, on 2 different media, with 1 copy being off site. All the repositories on the [Luque Lab GitHub organization](https://github.com/luquelab) are backed up frequently using two bash scripts. 

The first script clones a repository that already exists on GitHub, including all of the files, branches, and commits. This script is run when new repositories are created on the organization's website or the names of the repositories are changed. Each repository is cloned using the git clone command. Here is an example of cloning the Athena repository from the Luque Lab GitHub organization. 

```
  git clone https://github.com/luquelab/Athena.git;
```

The second script fetches and pulls each repository. This is to make sure each repository on your device is up to date with the respoitories on Github. For this following code to run without warnings or errors, the subfolders in the main backup folder should not be changed or include any other folders not available as repositories on GitHub. This is because the code goes through every subfolder and fetches the repository using the metadata available on your device in the particular subfolder. The code is as follows.

```
#!/bin/bash
for dir in */; do
        echo "$dir"

        echo "Entering directory";
        cd $dir;

        echo "Fetch";
        git fetch --all;

        echo "Pull";
        git pull --all;

        echo "All the branches";
        git branch -a

        echo "Exiting directory";
        cd ..;
done
```

The backup process is scheduled to run weekly. Upon completing the GitHub backup, the entire luquelab folder from the Cinci server is backed up to the Notos server using the following command:

```
  rsync -av --delete --force luquelab agarwal@notos.sdsu.edu:/mnt/beegfs/home/luquelab/backup
```

This ensures a seamless and secure transfer of data, maintaining the integrity of the luquelab folder for future reference and restoration purposes.





