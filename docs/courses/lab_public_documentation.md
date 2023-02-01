---
layout: default
title: Public documentation
nav_order: 1
parent: Lab Documentation
---

# Sharing the lab's knowledge

A core principle in the lab is to share the produced knowledge and technologies with the specialized and general audiences alike, independently of journals. The synthesis and description of the lab's research is a continuous task that must begin shaping at the very start of each project. 

The lab currently generates public documentation using [GitHub Pages](https://pages.github.com). [GitHub](http://github.com/) uses [Jekyll](http://jekyllrb.com/) to generate the static websites. To understand better how this works, check the [GitHub Pages documentation](https://docs.github.com/en/pages).


## Publishing the documentation of a new project
1. Create the repo using the [project_template](https://github.com/luquelab/project_template) repo as a template. Press the green "use this template" button, and make sure it's public.
2. Select the "Main" dropdown on the left, and create a gh-pages branch. This branch will be dedicated to monitor the changes on the website. Once the changes are satisfactory, the modifications should be merged in the repo's main branch.
3. To generate the website, go to the repo's Settings, click on the Pages panel. Use the /docs folder in the gh-pages branch as the website's source.
4. GitHub will automatically generate the static website. 
5. Any commited changes to the gh-pages branch will be reflected on the static website. Unfortunately, these changes are not instantaneous for sites hosted on GitHub Pages. Be patient and minimize structural changes.
6. To learn more about how to modify your documentation, explore the links in the theme associated with the [project template's repo site](http://luquelab.github.io/project_template/). Explore also the other public documentations from the lab. You can easily access the associated GitHub repos to mimick features that can help you in your documentation.

## Publishing the documentation of an ongoing project
1. Import the [/docs](https://github.com/luquelab/project_template/tree/main/docs) folder from the [project_template](https://github.com/luquelab/project_template) repo and adapt its structure as needed for your documentation. The Home and Synthesis sections must be kept and updated accordingly to the project.
2. The rest of the steps are analogous to the [new project section](#publishing-the-documentation-of-a-new-project), skipping step 1.

## Understanding useful advanced features
+ Customize the site modifying the [_config.yml](https://jekyllrb.com/docs/configuration/) file in /docs coded in [YAML](https://yaml.org). You will need to update the aux_links to link to your own repo, and to change "Project Template" to the name of your own project. 
+ Modify the structure and dependencies of your pages adapting the [Front Matter](https://jekyllrb.com/docs/front-matter/) section in your markdown files coded also using [YAML](https://yaml.org).
+ Modify the html templates of the [theme](https://jekyllrb.com/docs/themes/) if necessary.
+ Write math using [MathJax](http://mathjax.org/), which is based on [LaTex synthax](https://en.wikibooks.org/wiki/LaTeX/Mathematics). The [project_template](https://github.com/luquelab/project_template) repo contains a modified [head.html](https://github.com/luquelab/project_template/blob/main/docs/_includes/head.html) template supporting MathJax in the website.
