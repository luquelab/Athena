---
layout: default
title: Session 2 - Oct 27
nav_order: 2
parent: Capsid Anatomy Workshop 2021
grand_parent: Courses and Tutorials
published: true
---

# Capsid Geometrical Anatomy (Luque lab)

## Recorded zoom session

## Main session points

### Part 1: The Capsid Anatomy Athena

The Athena initiatve:
+ Share technical state-of-the-art science transparently.
+ Synthesize scienctific knowldege (provide big picture) to complement encyclopedic knowledge.
+ Decouple evolving scientific knowledge from publications, which are snapshots of science necessary for validation, advertisement, and promotion.

Temporary Athena site for the Capsid Anatomy project:
+ GitHub repo: <https://github.com/luquelab/auto-lattice>
+ Online public documentation: <https://luquelab.github.io/auto-lattice>

Capsid anatomy:
+ Capsid composition and stoichiometry
    + Major capsid protein, minor capsid protein, scaffold, reinforcemen proteins, and decoration proteins.
    + Functions other than major capsid protein are usually fuzzy!

![Patience capsid anatomy](/images/2021-10-27/patience.png)

![Patience capsid inside](/images/2021-10-27/patience_inside.png)


+ Capsid diameter, surface, volume, and asphericity (internal and external)
    + Chimera tools: ...
+ Capsid geometric architecture: Lattice and T-number (icosahedral) , Lattice T-number, and Q-number (elongated),...
    + Generalized T-numbers: [Twarock and Luque, Nature Communications, 2019](https://doi.org/10.1038/s41467-019-12367-3).
    + Chimera X: [hkcage command](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/hkcage.html) and [hkcage bundle](https://cxtoolshed.rbvi.ucsf.edu/apps/chimeraxhkcage).
    + First used in [Luque *et al.* Microorganisms, 2020](https://doi.org/10.3390/microorganisms8121944). 

How to assign T-numbers:

+ Molecular approach: Correspondence between geometric tiles and protein clusters.
    + Example: Bacteriophage P22 (PDB 5uu5)
    + ![5uu5 hexagonal](/images/2021-10-27/pdb_5uu5_hexagonal_lattice.png)
    + ![5uu5 trihex](/images/2021-10-27/pdb_5uu5_trihex_lattice.png)
    + ![5uu5 trihex-dual](/images/2021-10-27/pdb_5uu5_trihex-dual_lattice.png)
    + Observation: HK97-fold sliding mechanism: <https://luquelab.github.io/auto-lattice/output/>

+ Mechanical approach: Correspondence between geometric tiles and quasi-rigid protein domains.
+ The auto-lattice protocol aims to offer an automatic strategy with human validation.
+ Show example (5uu5) and current outputs.
+ Give insight so far: what looks like a trihex on the surface is a solid hex interiorly: The fish scale mechanism of HK97-fold proteins.


### Part 2: Current auto-lattice (criteria 1)
+ More manual than automatic.
+ It will represent our first effort.

### Part 2: Quasi-rigid domains (criteria 2)
+ A potentially more automatic approach.
+ Challenge with large capsids.


