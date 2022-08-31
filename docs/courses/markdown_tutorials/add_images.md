---
layout: default
title: Adding Images to Markdown Files
nav_order: 6
parent: GitHub for Luque Lab
grand_parent: Lab Documentation
---

# Adding Images to Markdown Files

## SVG Files
SVG files work best for our purposes, but JPGs and PNGs work as well. When you do use SVG files, make sure that you do not check the box to preserve illustrator editing capabilites. 

The process of adding images to markdown files is fairly simple. But before you start adding images to your markdown file, you need to create an images folder. 

To do that, navigate to the same directory your markdown file is located in, and click on "Add file", and create a new file.

![create_file](/images/add_images/new_file.png){:width="300px"}

Name your file "images" and add a forward slash (/) at the end so that github understands you're adding a folder.

![make_folder](/images/add_images/make_folder.png){:width="500px"}

Add a README.md to your images folder breifly stating where the images stored in the folder are going to be implemented. 

![make_readme](/images/add_images/make_readme.png){:width="500px"}

Commit the changes and navigate back to the images folder you just created.

Chances are you are going to have multiple markdown pages in the same directory that will all be implementing pngs. Inside the images folder we will create a different folder for each markdown file that will be using PNGs. 

Name the new folder after the markdown file, and add the README.md with a brief statement about where the images will be implemented.

I have named this markdown file I am currently using as "add_images" so I will name my images folder for this page "add_images".

![add_images](/images/add_images/add_images.png){:width="500px"}

Make sure you have named your PNGs descriptively, and then drag and drop them into your folder. Commit the changes.

You will use the following syntax to add your image into the markdown file:

![image_syntax](/images/add_images/image_syntax.png){:width="400px"}

"alt_text" is what will show up on the webpage should the image fail. The file path provides the location of the PNG. 

If you want to include an image of a puppy in a folder named animals, your alt text might be "puppy" and your file path would be /images/animals/puppy.png

![puppy_example](/images/add_images/puppy_example.png){:width="400px"}

However, you may want to resize the image you are using. In that case, you would use the following syntax, and would have to play around with the pixels to find a size that works for you. The image height will adjust as you adjust the image width.

![adjust_width](/images/add_images/adjust_width.png){:width="400px"}

