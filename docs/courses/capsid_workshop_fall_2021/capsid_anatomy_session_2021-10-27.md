---
layout: default
title: Session 2
nav_order: 2
parent: Capsid Anatomy Workshop 2021
grand_parent: Courses and Tutorials
published: true
---

# Capsid Geometrical Anatomy (Luque lab)
October 27, 2021

## Part 1: The Athena initiative

### The three foundations of Athena:
1. Constant restructuring (refactoring) of scienctific knowldege.
    + Restraining the spontaneous increase of scientific noise (entropy).
2. Sharing state-of-the-art science transparently and unpretentiously.
    + Reducing inaccessibility of scientific knowledge and bombastic rhetoric.
3. Governing scientific knowledge of the people, for the people, and by the people.
    + Decoupling knowledge from journal publications (validation, advertisement, and promotion).

### Temporary Athena site for the Capsid Anatomy project:
+ GitHub repo: <https://github.com/luquelab/auto-lattice>
+ Online public documentation: <https://luquelab.github.io/auto-lattice>

## Part 2: Capsid anatomy:

### Capsid molecular composition
+ Stoichiometry: Major capsid, minor capsid, scaffold, reinforcemen, and decoration proteins.
+ Functions other than major capsid protein are usually fuzzy!

### Capsid physical properties
+ Diameter, surface, volume, and sphericity (internal and external).
    + Chimera: [Icosahedron surface](https://www.cgl.ucsf.edu/chimera/docs/ContributedSoftware/icosahedron/icosahedron.html).
+ Elasticity and brittleness.
    + No standard approach. 

### Capsid geometric architecture:
+ T-number and icosahedral lattice; Q-number for elongated structures.
+ Generalized T-numbers: [Twarock and Luque, Nature Communications, 2019](https://doi.org/10.1038/s41467-019-12367-3).
+ Chimera X: [hkcage command](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/hkcage.html) and [hkcage bundle](https://cxtoolshed.rbvi.ucsf.edu/apps/chimeraxhkcage).
+ First used in [Luque *et al.* Microorganisms, 2020](https://doi.org/10.3390/microorganisms8121944). 

### How to assign T-numbers:

**Molecular approach**: Correspondence between geometric tiles and protein clusters.
+ Example: Bacteriophage P22 (PDB 5uu5)
    + ![5uu5 hexagonal](/images/2021-10-27/pdb_5uu5_hexagonal_lattice.png)
    + ![5uu5 trihex](/images/2021-10-27/pdb_5uu5_trihex_lattice.png)
    + ![5uu5 trihex-dual](/images/2021-10-27/pdb_5uu5_trihex-dual_lattice.png)
+ Observation: *Challenge identifying minor capsid proteins:*

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

### Part 2: Mechanical approach (Colin Brown)


