---
layout: default
title: Session 2
nav_order: 2
parent: Capsid Anatomy Workshop 2021
grand_parent: Lab Documentation
published: true
---

# Capsid Geometrical Anatomy (Luque lab)
October 27, 2021

### Zoom session
+ [Public recording with integrated audio transcript.](https://sdsu.zoom.us/rec/share/6SKUAbu6C3IYjXK-FQI5L45YlJ_xt5rO1y2ewvk4E--gEtv-_BQL5mqcaV0mgYJs.ZWoPRpkz3_gLsCBO)

### Access to workshop files
+ Folder in the [Athena GitHub repo](https://github.com/luquelab/Athena/tree/gh-pages/docs/courses/capsid_workshop_fall_2021).
+ Online content provided by GitHub pages is based on the standard lab's [public documentation system](https://luquelab.github.io/Athena/courses/lab_public_documentation.html).
+ Our approach to share knowledge steams from our [Athena initiative](https://luquelab.github.io/Athena/knowledge/synthesis.html).

### Temporary Athena site for the Capsid Anatomy project:
+ GitHub research repo: <https://github.com/luquelab/auto-lattice>
+ Accessible online site: <https://luquelab.github.io/auto-lattice>

## Part 1: Capsid anatomy

### Capsid molecular composition
+ Stoichiometry: Major capsid, minor capsid, scaffold, reinforcemen, and decoration proteins.
+ Functions other than major capsid protein are usually fuzzy!

### Capsid physical properties
+ Diameter, surface, volume, and sphericity (internal and external).
    + Chimera: [Icosahedron surface](https://www.cgl.ucsf.edu/chimera/docs/ContributedSoftware/icosahedron/icosahedron.html).
+ Elasticity and brittleness.
    + No standard approach. 

### Capsid geometric architecture
+ T-number and icosahedral lattice; Q-number for elongated structures.
+ Generalized T-numbers: [Twarock and Luque, Nature Communications, 2019](https://doi.org/10.1038/s41467-019-12367-3).
+ Chimera X: [hkcage command](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/hkcage.html) and [hkcage bundle](https://cxtoolshed.rbvi.ucsf.edu/apps/chimeraxhkcage).
+ First used in [Luque *et al.* Microorganisms, 2020](https://doi.org/10.3390/microorganisms8121944). 

### How to assign T-numbers

**Molecular approach**: Correspondence between geometric tiles and protein clusters.
+ Example: Bacteriophage P22 (PDB 5uu5)
    + ![5uu5 hexagonal](/images/2021-10-27/pdb_5uu5_hexagonal_lattice.png)
    + ![5uu5 trihex](/images/2021-10-27/pdb_5uu5_trihex_lattice.png)
    + ![5uu5 trihex-dual](/images/2021-10-27/pdb_5uu5_trihex-dual_lattice.png)
+ Observation: *Challenge assigning minor capsid protein function:*

    + ![Patience capsid anatomy](/images/2021-10-27/patience.png)

    + ![Patience capsid inside](/images/2021-10-27/patience_inside.png)
    
+ Observation: *The HK97-fold sliding hypothesis:*

    + ![HK97 capsid anatomy gallery](https://luquelab.github.io/auto-lattice/output/2fs3.png)

    + ![Patience capsid anatomy gallery](https://luquelab.github.io/auto-lattice/output/patience.png)

    + More examples in <https://luquelab.github.io/auto-lattice/output/>.


**Mechanical approach**: Correspondence between quasi-rigid regions and geometrical tiles.
+ Elastic analysis of capsids
    + Perturbation analysis of alpha-carbon capsid models.
    + Example: Small tobacco necrosis virus (PDB 1A34):
    + ![STNV-decomposition](https://luquelab.github.io/cbrown_thesis_athena/output/Subdivisions/1a34_20_domains_optimal.png)
    + ![STNV-animation](/images/2021-10-27/STNV_elastic_decomposition_giphy.gif)
    + Computational challenge: *large* capsids.

### Part 2: Molecular approach (Diana Lee)

### Part 3: Mechanical approach (Colin Brown)


