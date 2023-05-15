---
layout: default
title: Python Package Build Process - PyPI
nav_order: 1
parent: Installable python package
grand_parent: Lab Documentation
has_children: False
---

# Python Package Build Process: PyPI
The following tutorial gives the process to create a python package. 

1. Make sure you have the latest version of pip installed on your device. To update pip run the following command:

    - Linux/Mac: ``` python3 -m pip install --upgrade pip```
    - Windows: ``` py -m pip install --upgrade pip ``` 

2. Begin with creating the following file structure locally. Make sure the package name here is unique. The structure is as follows:

```
project/
└───src/
│   └───package_name
│         └─── __init__.py
│         └─── example.py
```

- Continue to populate the files added:
    - Package name that contains the python files should match the project name. 
    - ```__init__.py``` is required to import the directory as a package, and should be empty
    - ```example.py``` is an example of a module within the package that could contain the logic (functions, classes, constants, etc.) of your package


3. Update the project structure as follows
```
project/
│   README.md
|   setup.py
│   LICENCE
└───src/
│   └───package_name
│       │   __init__.py
│       │   example.py
└───tests\
```

- ``` setup.py``` tells “frontend” build tools like pip and build what “backend” tool to use to create distribution packages for your project. ```setup.py``` contains the following content.

    1. name: A string containing the package’s name.
    2. version: A string containing the package’s version number.
    3. description: A single-line text explaining the package.
    4. author: A string identifying the package’s creator/author.
    5. long_description: A string containing a more detailed description of the package.
    6. maintainer: It's a string providing the current maintainer’s name, if not the author. If the maintainer is not given, the author in PKG-INFO will be utilized by the setup tools.
    7. url: A string providing the package’s homepage URL (usually the GitHub repository or the PyPI page).
    8. download_url: A string containing the URL where the package may be downloaded.
    9. package_data: This is a dictionary where the keys are package names and the values are lists of glob patterns.
    10. py_modules: A string list containing the modules that setup tools will modify.
    11. python_requires: This is a comma-separated string providing Python version specifiers for the package’s supported Python versions.
    12. install_requires: A string list containing only the dependencies necessary for the package to function effectively.
    13. keywords: A comma-separated string or string list providing descriptive meta-data.
    14. entry_points: This is a dictionary with keys corresponding to entry point names and values corresponding to the actual entry points stated in the source code.
    15. license: A string containing the package’s licensing information.
    16. keywords: A list of keywords.
    17. long_description: longer description of the package.

Example:
``` 
from setuptools import setup
setup(
    name='app-name'
    version='1.0',
    author='Bejamin Frakline',
    description='A brief synopsis of the project',
    long_description='A much longer explanation of the project and helpful resources',
    url='https://github.com/BenjaminFranline',
    keywords='development, setup, setuptools',
    python_requires='>=3.7, <4',
    packages=find_packages(include=['exampleproject', 'exampleproject.*']),
    install_requires=[
        'PyYAML',
        'pandas==0.23.3',
        'numpy>=1.14.5',
        'matplotlib>=2.2.0,,
        'jupyter'
    ],
    package_data={
        'sample': ['sample_data.csv'],
    },
    entry_points={
        'runners': [
            'sample=sample:main',
        ]
    }
)
```
- Create README.md to give users a detailed description of the package
- Create a License

4. Generate distribution packages for the package. These are archives that are uploaded to the Python Package Index that can be installed by ```pip```
    - Run the following command from the same directory where pyproject.toml is located: 
    - Linux/Mac: ``` python3 -m pip install --upgrade build ```
    - Windows: ``` py -m build ```
    - This command should output a lot of text and once completed should generate two files in the ```dist``` directory:
5. Upload the distribution archives 
    - Register an account on [TestPyPI](https://test.pypi.org/account/register/),which is a separate instance of the package index intended for testing and experimentation.
    - Use [twine](https://packaging.python.org/en/latest/key_projects/#twine) tp upload the distribution packages

        - Linux/Mac: ```python3 -m pip install --upgrade twine```
        - Windows: ```py -m pip install --upgrade twine```
    - Run Twine to upload all the archives under ```dist```
        - Linux/Mac: ```python3 -m twine upload --repository testpypi dist/*```
        - Windows: ```py -m twine upload --repository testpypi dist/*```
    - You will be prompted for a username and password. For the username, use ```__token__```. For the password, use the token value, including the pypi- prefix.
        - Once uploaded, your package should be viewable on TestPyPI; for example: https://test.pypi.org/project/package_name.
    
6. Installing the newly uploaded package
- You can use pip to install your package and verify that it works. Create a virtual environment and install your package from TestPyPI:
    - Linux/Mac: ``` python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps package_name```
    - Windows: ``` py -m pip install --index-url https://test.pypi.org/simple/ --no-deps package_name```
- Test if the package was installed correctly by importing the package. Make sure you are still in the virtual environment, then run python by running the command:
    - Linux/Mac: ```python3```
    - Windows: ```py```
- Import the package
    - ``` from package_name import func ```
    -  Call one of the functions in the package
7. You've now packaged and distributed a Python project

--- 

-  ```pyproject.toml``` can be used instead of ```setup.py```. Both these files serve the same purpose. 
    -  Open ```pyproject.toml``` and enter the ```[build-system]``` tables: ``` [build-system]\ requires = ["hatchling"]\ build-backend = "hatchling.build" ```
         - ```requires``` is a list of packages that are needed to build your package. You don’t need to install them; build frontends like pip will install them automatically in a temporary, isolated virtual environment for use during the build process
        - ``build-backend``` is the name of the Python object that frontends will use to perform the build.
    - Configure metadata as follows:
  
```
[project]
name = "example_package_YOUR_USERNAME_HERE"
version = "0.0.1"
authors = [
  { name="Example Author", email="author@example.com" },
]
description = "A small example package"
readme = "README.md"
requires-python = ">=3.7"
classifiers = [
    "Programming Language :: Python :: 3",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
]

[project.urls]
"Homepage" = "https://github.com/pypa/sampleproject"
"Bug Tracker" = "https://github.com/pypa/sampleproject/issues" 
```
