---
layout: default
title: Git though command line
nav_order: 2
parent: GitHub for Luque Lab
grand_parent: Lab Documentation
---

# **Git through command line**

Here are some useful resources about using git through command line:
- [Start using Git on the command line](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html)
- [Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)
- [Git command-line fundamentals](https://www.youtube.com/watch?v=HVsySz-h9r4)

## Basic git commands
- git --version 
  - To check the version of git 
  
- git init 
  - This command initializes your local repository 
 
- git status 
  - To check the status of the repository. 
  - Working area: Files that are not yet added to the repository are stored here (Untracked files)
  - Staging area: Files that are going to be a part of the next commit 

- git add
  - To add files into the staging area from your workspace 
 
- git commit -m "your message"
  - This command lets you add your files to the local repository, -m gives you the option to pass a message
 
- git log
  - This commands allows you to view all the commits and changes made by the user
 
- git clone "Repo_url"
  - This command makes a copy of the remote repository and it's branches on your local computer 

- git branch branch_name
  - This command creates a new branch

- git checkout branch_name
  - This switches you from one branch to another 
