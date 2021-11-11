---
layout: default
title: Submitting Jobs On The cinci cluster.
nav_order: 4
parent: Courses and Tutorials
---

# Using qsub To Submit Your Python Scripts

To submit a python script you first need to include a header in the .py file.

~~~
#! ~/anaconda3/bin/python
#PBS -l nodes=2:ppn=24
#PBS -l walltime=02:00:00
~~~


The first line points to the python interpreter you will be using. The second and third lines request resources for the 
job. This job requests two nodes with 24 processors per node (ppn). This combination would run the job using two of the 
12 core 24 thread CPUs on the cluster. 

If the script has no inputs and does not require/modify local files then you can now submit your script as a job using the 
command:

~~~
qsub myscript.py
~~~

After completion there will be two files named `myscript.py.o[job_id]` and `myscript.py.e[job_id]` containing the standard
print output and error output of the program. 

If your script requires command line inputs then you can include them using the flag -F:

~~~
qsub myscript.py -F "input1 input2 input3" 
~~~

If your script reads/writes from local files then you must specify the target working directory using the flag -d:

~~~
qsub myscript.py -d "/path/to/working/dir" 
~~~

Any manipulation of the working directory within the python script (i.e. using `os.chdir()`) will have to take this into
account.

Finally, if your script imports local modules (i.e. any modules not install in the default package locations 
of the interpreter you chose.) then you will need to add the following lines to your script before importing them.

~~~
import sys
sys.path.append('/path/to/moduleDir/')
~~~
This will add the target directory to the list of locations to check for modules to import.

