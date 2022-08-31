---
layout: default
title: Adding Dropdown Menus for GitHub pages
nav_order: 5
parent: GitHub for Luque Lab
grand_parent: Lab Documentation
---

# Adding Dropdown Menus to Projects 
Dropdown menus are a helpful way of organizing information. Here, on the Athena Website, we have several dropdown menus including "Courses and Tutorials" which will serve as the example for this tutorial. 

On Github, we have stored a "Courses and Tutorials" folder that contains the index mark down file (index.md) and the markdown files for each of the child pages. 

You will first need to add the following has_children attribute to your parent page's index file. For example, on this website, "Courses and Tutorials" is the parent page, and it extends the children "Core Readings", "Github", etc., but don't worry about the children quite yet.

![has_children](/images/add_dropdowns/has_children.png){:width="350px"}

Now that we've given the Courses and Tutorials index the has_children attribute and set it to true, a downwards pointing arrow is displayed beside it. However, when you click on the carrot, there's nothing there. 

![courses_and_materials](/images/add_dropdowns/courses.png){:width="200px"}

We still need to add the parent attributes to the children. Open a markdown file you wish to be contained within the dropdown menu, and add the parent attribute. Check the title attribute of the parent page (in this case, the Courses and Tutorials index.md file) to make sure you are attaching the correct page. 

![parent](/images/add_dropdowns/parent.png){:width="350px"}

## Nested Dropdown Menus 

You can also create dropdown menus within dropdown menus by adding a grand_parent attribute to the grand child, and adding a has_children attribute to the child. 

For this example, Courses and Tutorials is the grandparent, Markdown Tutorials is the child, and Adding Dropdown Menus will be the grandchild. We will be adding the has_children attribute to the Markdown Tutorials index.md, and the grand_parent attribute to the Adding Dropdown Menus file. 

Here, I've added the grand_parent attribute to this page we're on (Adding Dropdown Menus). Since the initial dropdown menu was Courses and Tutorials, we will enter that as the title for the grand_parent attribute. 

![grand_parent](/images/add_dropdowns/grand_parent.png){:width="350px"}

Then I added the has_children attribute to the Markdown Tutorials index file, which is the parent of the grandchild. 

![child_has_children](/images/add_dropdowns/child_has_children.png){:width="350px"}

Now, your dropdown menus should be nested like so:

![nested](/images/add_dropdowns/nested.png){:width="250px"}

