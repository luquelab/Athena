---
layout: default
title: Python Package Build Process - Conda
nav_order: 2
parent: Installable python package
grand_parent: Lab Documentation
has_children: False
---

# Building conda packages 

This tutorial describes how to build a conda package 

1. Install [Miniconda or Anaconda](https://docs.anaconda.com/anaconda/install/), conda-build and Git 

    - After installing miniconda or anaconda, use conda to install conda-build and Git.
    - To install conda-build in your terminal window or an anaconda prompt, run:

        ``` 
        conda install conda-build
        ```
    - Git can be installed by following the steps mentioned [here](https://github.com/git-guides/install-git).
    - Follow [Building conda packages with conda skeleton](https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/build-pkgs-skeleton.html). The lab's GitHub template already has the basic skeleton. 

2. Edit the [meta.yaml](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html) file. It should look something like this:
    {% raw %}
    ```
    {% set version = "1.1.0" %}

    package:
    name: imagesize
    version: {{ version }}

    source:
    git_url: https://github.com/ilanschnell/bsdiff4.git
    git_rev: 1.1.4
    git_depth: 1 # (Defaults to -1/not shallow)

    build:
    noarch: python
    number: 0
    script: python -m pip install .

    requirements:
    host:
        - python
        - pip
    run:
        - python

    test:
    imports:
        - imagesize

    about:
    home: https://github.com/shibukawa/imagesize_py
    license: MIT
    summary: 'Getting image size from png/jpeg/jpeg2000/gif file'
    description: |
        This module analyzes jpeg/jpeg2000/png/gif image header and
        return image size.
    dev_url: https://github.com/shibukawa/imagesize_py
    doc_url: https://pypi.python.org/pypi/imagesize
    doc_source_url: https://github.com/shibukawa/imagesize_py/blob/master/README.rst

    ```
    {% endraw %}
    - Here is another example from the pyCapsid repository 

    {% raw %}
    ```
    #{% set data = load_setup_py_data() %}

    package:
    name: pycapsid
    version: 0.1.9

    source:
    path: ..
    #url: https://pypi.io/packages/source/{{ name[0] }}/{{ name }}/{{ name }}-{{ version }}.tar.gz
    # If getting the source from GitHub, remove the line above,
    # uncomment the line below, and modify as needed. Use releases if available:
    #url: https://github.com/luquelab/pyCapsid/archive/refs/heads/colin_branch.zip
    # and otherwise fall back to archive:
    # url: https://github.com/simplejson/simplejson/archive/v{{ version }}.tar.gz
    #sha256: 2b3a0c466fb4a1014ea131c2b8ea7c519f9278eba73d6fcb361b7bdb4fd494e9
    # sha256 is the preferred checksum -- you can get it for a file with:
    #  `openssl sha256 <file name>`.
    # You may need the openssl package, available on conda-forge:
    #  `conda install openssl -c conda-forge``

    build:
    script: python -m pip install . -vv
    number: 1
    # Uncomment the following line if the package is pure Python and the recipe is exactly the same for all platforms.
    # It is okay if the dependencies are not built for all platforms/versions, although selectors are still not allowed.
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#noarch-python for more details.
    noarch: python
    # If the installation is complex, or different between Unix and Windows, use separate bld.bat and build.sh files instead of this key.
    # By default, the package will be built for the Python versions supported by conda-forge and for all major OSs.
    # Add the line "skip: True  # [py<35]" (for example) to limit to Python 3.5 and newer, or "skip: True  # [not win]" to limit to Windows.
    # More info about selectors can be found in the conda-build docs:
    # https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#preprocessing-selectors


    requirements:
    host:
        - python <3.11
        - pip
        - setuptools
        - setuptools-scm
    run:
        - python<3.11
        - biotite
        - scikit-learn
        - numpy<1.24
        - scipy
        - matplotlib-base
        - numba
        - statsmodels

    test:
    # Some packages might need a `test/commands` key to check CLI.
    # List all the packages/modules that `run_test.py` imports.
    imports:
        - pyCapsid
    # For python packages, it is useful to run pip check. However, sometimes the
    # metadata used by pip is out of date. Thus this section is optional if it is
    # failing.
    requires:
        - pip

    about:
    home: https://github.com/luquelab/pycapsid
    summary: A set of computational tools written in python for the analysis of viral capsids
    # Remember to specify the license variants for BSD, Apache, GPL, and LGPL.
    # Use the SPDX identifier, e.g: GPL-2.0-only instead of GNU General Public License version 2.0
    # See https://spdx.org/licenses/
    license: MIT
    # The license_family, i.e. "BSD" if license is "BSD-3-Clause".
    # Optional
    license_family: MIT
    # It is required to include a license file in the package,
    # (even if the license doesn't require it) using the license_file entry.
    # Please also note that some projects have multiple license files which all need to be added using a valid yaml list.
    # See https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#license-file
    license_file: LICENSE.txt
    # The doc_url and dev_url are optional.
    #doc_url: https://simplejson.readthedocs.io/
    #dev_url: https://github.com/simplejson/simplejson

    extra:
    recipe-maintainers:
        - colintravisbrown
    #    # GitHub IDs for maintainers of the recipe.
    #    # Always check with the people listed below if they are OK becoming maintainers of the recipe. (There will be spam!)
    #    - LisaSimpson
    #    - LandoCalrissian
    ```
   {% endraw %}

3. Write build script files build.sh and bls.bat if noarch: python is not included.
    - ```build.sh```---Shell script for macOS and Linux.
    - ```bld.bat```---Batch file for Windows.   
    - The 2 files ```build.sh``` and ```bld.bat``` must be in the same directory as your ```meta.yaml``` file.

    **bld.bat**
    
    - Type exactly as shown below in ```bld.bat```
        ```
        "%PYTHON%" setup.py install
        if errorlevel 1 exit 1  
        ``` 

    **build.sh**

    - Type exactly as shown below in ```build.sh```
        ```
        $PYTHON setup.py install     # Python command to install the script.

        ```
4. Building and Installing 
    - Run conda-build:
        ```
        conda-build click
        ```
    - If the package has dependencies, link the channel containing them when doing conda build. 
        ```
        conda build -c conda-forge --output-folder .
        ```
    - When conda-build is finished, it displays the package filename and location. 
    - Install your newly built program on your local computer by using the ```use-local``` flag:
        ```
        conda install --use-local click
        ```

5. Uploading new packages to Anaconda.org
    - Open an account on Anaconda.org.
    - Run the command ```conda install anaconda-client```, enter your username and password. 
    - Log into your [Anaconda.org](http://anaconda.org/) account with the command:
        ```
        anaconda login
        ```
    - Upload your package to Anaconda.org
        ```
        anaconda upload ~/miniconda/conda-bld/linux-64/click-7.0-py37_0.tar.bz2
        ```

6. Installing the package after uploading it 
    - First, create a new virtual environment using conda and then activate it.

        ```
        conda create -n envName python=3.10 -y
        conda activate envName
        ```
        ```
        conda install -c account_name -c conda-forge package-name
        ```
