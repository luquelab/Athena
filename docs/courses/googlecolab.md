---
layout: default
title: Google Colab
nav_order: 6
parent: Lab Documentation
---

# Google Colab Instructions

Google Colab is a free cloud-based platform that allows you to write and run code in your browser. It's a great tool for learning, experimenting, and collaborating on projects. This website provides you with some basic instructions to help you get started with Google Colab.

## Step 1: Accessing Google Colab

1. Open your web browser and go to the Google Colab website: [colab.research.google.com](https://colab.research.google.com/).
2. You will be prompted to sign in with your Google account. If you don't have one, you can create a new account for free.
3. Once signed in, you'll be redirected to the Google Colab homepage.

## Step 2: Creating a New Notebook

1. Click on the "New Notebook" button on the Google Colab homepage.
2. A new notebook will be created, and you will be redirected to the notebook editor.

## Step 3: Working with Notebooks

1. Notebooks consist of cells where you can write and execute code.
2. To add a new cell, click on the "+" button in the toolbar or press `Ctrl/Cmd + M B` for inserting a cell below or `Ctrl/Cmd + M A` for inserting a cell above.
3. You can change the type of a cell to code or markdown by selecting the cell and clicking on the cell type dropdown in the toolbar.
4. To execute a code cell, click on the play button on the left side of the cell or press `Ctrl/Cmd + Enter`. The code will be executed, and the output (if any) will be displayed below the cell.

## Step 4: Using `pip install` in Google Colab

1. Google Colab provides a pre-installed environment with many popular Python libraries. However, if you need to install additional packages, you can use the `pip install` command.
2. To install a package, create a new code cell and type the following command:
  ```
    !pip install package_name
  ```
Replace `package_name` with the name of the package you want to install.

3. After typing the command, execute the cell to install the package. The installation may take a few moments, and the output will be displayed below the cell.
4. Once installed, you can import and use the package in subsequent code cells.

## Step 5: Saving and Sharing Notebooks

1. Google Colab automatically saves your notebooks to your Google Drive. You can access them anytime from the "Google Drive" tab on the left panel.
2. To share a notebook with others, click on the "Share" button in the toolbar. You can specify the access permissions and get a shareable link.

## Step 6: Using GPU and TPU

1. Google Colab provides free access to GPUs and TPUs, which can greatly accelerate your code.
2. To enable GPU or TPU acceleration, go to the "Runtime" menu, select "Change runtime type," and choose the desired accelerator from the "Hardware accelerator" dropdown.
3. Note that the availability of GPUs and TPUs may vary depending on the current demand.

These are the basic instructions to get started with Google Colab.

## Additional Topics

Here are some additional topics that you may find helpful when working with Google Colab:

### Managing Code and Text Cells

- You can add, delete, rearrange, and merge cells in Google Colab. To convert cells between code and text (markdown) formats, select the cell and click on the cell type dropdown in the toolbar.

### Using Code Snippets and Code Completion

- Google Colab provides code snippets and code completion features that can enhance productivity. Take advantage of these features to speed up your coding process.

### Importing and Exporting Notebooks

- In addition to saving notebooks to Google Drive, you can import existing notebooks into Google Colab. You can also export notebooks to different formats, such as `.ipynb` or `.py` files.

### Collaboration and Version Control

- Google Colab allows for real-time collaboration with others. Multiple users can work on the same notebook simultaneously. You can also use version control tools like GitHub to manage notebook versions.

### Using External Data

- If you need to work with external data in your notebooks, you can upload data files or connect to external data sources such as Google Drive, Google Sheets, or cloud storage services.
