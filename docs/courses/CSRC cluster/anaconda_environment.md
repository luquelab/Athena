---
layout: default
title: Entering the conda environment on cinci cluster
nav_order: 2
parent: CSRC cluster
grand_parent: Lab Documentation
---

# Entering the conda environment on cinci cluster

~~~
# .bashrc
# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
~~~

.bashrc initializes an interactive shell session. The bottom three lines are to prompt the user before deletion, overwriting and moving the file.

~~~
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/usr/local/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
~~~

/etc/bashrc contains system wide funtions and aliases. Environment related files and programs are available in etc/profile. 
The if .. fi statement is the fundamental control statement that allows shell to make decisions and execute statements conditionally.




