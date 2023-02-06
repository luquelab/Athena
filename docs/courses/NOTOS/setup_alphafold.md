---
layout: default
title: Setting up Alphafold
nav_order: 1
parent: Alphafold on Notos server 
grand_parent: Lab Documentation
has_children: false
---

# AlphaFold on Notos

This document provides the implementation of the pipeline of [AlphaFold V2.0](https://github.com/deepmind/alphafold) on the notos server at the Computational Science Research Center, SDSU. The notos server is managed by Dr. Christopher Paolini ([Email](paolini@engineering.sdsu.edu)).

There are two CPU sockets on notos. Since, notos is not a cluster with compute nodes there is no batch scheduler. Scripts/ commands can be run on multiple GNU Screen session. More instructions are given at the end of this document. Follow [Running AlphaFold on GNU Screen session](#Running-Multiple-files-on-Alphafold).

More information about AlphaFold can be found [here](https://github.com/deepmind/alphafold/blob/main/README.md).

---
## First time setup

The following steps are required in order to run AlphaFold:

1.  Install [Docker](https://www.docker.com/).
    *   Install
        [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
        for GPU support.
    *   Setup running
        [Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user).
    *   **Docker and NVIDIA Container Toolkit have been installed on notos and are up-to date as of 6/9/2022. As each new user follows the steps below to run alphafold they must contact Dr. Christopher Paolini ([Email](paolini@engineering.sdsu.edu)) for docker access.**
1.  Download genetic databases and model parameters.
    * *The genetic databases and model parameters have been downloaded and can be found on the notos server at* 
    ```bash
    /mnt/beegfs/alphafold/databases
    ```
1.  Check that AlphaFold will be able to use a GPU by running:

    ```bash
    docker run --rm --gpus all nvidia/cuda:11.6.0-base-ubuntu20.04 nvidia-smi
    ```

    The output of this command should show a list of your GPUs.

---

## Genetic databases - Downloaded on Notos

This step requires `aria2c` which is already installed and is available on the notos server. 

AlphaFold needs multiple genetic (sequence) databases to run:

*   [BFD](https://bfd.mmseqs.com/),
*   [MGnify](https://www.ebi.ac.uk/metagenomics/),
*   [PDB70](http://wwwuser.gwdg.de/~compbiol/data/hhsuite/databases/hhsuite_dbs/),
*   [PDB](https://www.rcsb.org/) (structures in the mmCIF format),
*   [PDB seqres](https://www.rcsb.org/) – only for AlphaFold-Multimer,
*   [Uniclust30](https://uniclust.mmseqs.com/),
*   [UniProt](https://www.uniprot.org/uniprot/) – only for AlphaFold-Multimer,
*   [UniRef90](https://www.uniprot.org/help/uniref).

A script `scripts/download_all_data.sh` is provided  on the official alphafold readme where you can download and set up all of the databases. *This script did not work as intended on the notos server. A workaround is to manually download all the databases using the scripts available at* `scripts/` *on the [Alphafold github respository](https://github.com/deepmind/alphafold)*

 The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

*   Default:

    ```bash
    bash scripts/download_alphafold_params.sh <DOWNLOAD_DIR>

    bash scripts/download_bfd.sh <DOWNLOAD_DIR>

    bash scripts/download_mgnify.sh <DOWNLOAD_DIR>

    bash scripts/download_pdb70.sh <DOWNLOAD_DIR>

    bash scripts/download_pdb_mmcif.sh <DOWNLOAD_DIR>

    bash scripts/download_pdb_seqres.sh <DOWNLOAD_DIR>

    bash scripts/download_uniclust30.sh <DOWNLOAD_DIR>

    bash scripts/download_uniprot.sh <DOWNLOAD_DIR>

    bash scripts/download_uniref90.sh <DOWNLOAD_DIR>

    ```

*   With `reduced_dbs`:

    ```bash
    bash scripts/download_small_bfd.sh <DOWNLOAD_DIR> 
    ```
    instead of `download_bfd.sh`, will download a reduced version of the databases to be used with the
    `reduced_dbs` database preset.

**Note: The download directory `<DOWNLOAD_DIR>` should _not_ be a
subdirectory in the AlphaFold repository directory.** If it is, the Docker build
will be slow as the large databases will be copied during the image creation.

**Note: The total download size for the full databases is around 415 GB
and the total size when unzipped is 2.2 TB.**

Once the script has finished, you should have the following directory structure: 

```
$DOWNLOAD_DIR/                             # Total: ~ 2.2 TB (download: 438 GB)
    bfd/                                   # ~ 1.7 TB (download: 271.6 GB)
        # 6 files.
    mgnify/                                # ~ 64 GB (download: 32.9 GB)
        mgy_clusters_2018_12.fa
    params/                                # ~ 3.5 GB (download: 3.5 GB)
        # 5 CASP14 models,
        # 5 pTM models,
        # 5 AlphaFold-Multimer models,
        # LICENSE,
        # = 16 files.
    pdb70/                                 # ~ 56 GB (download: 19.5 GB)
        # 9 files.
    pdb_mmcif/                             # ~ 206 GB (download: 46 GB)
        mmcif_files/
            # About 180,000 .cif files.
        obsolete.dat
    pdb_seqres/                            # ~ 0.2 GB (download: 0.2 GB)
        pdb_seqres.txt
    small_bfd/                             # ~ 17 GB (download: 9.6 GB)
        bfd-first_non_consensus_sequences.fasta
    uniclust30/                            # ~ 86 GB (download: 24.9 GB)
        uniclust30_2018_08/
            # 13 files.
    uniprot/                               # ~ 98.3 GB (download: 49 GB)
        uniprot.fasta
    uniref90/                              # ~ 58 GB (download: 29.7 GB)
        uniref90.fasta
```
*The genetic databases and model parameters have been downloaded and can be found on the notos server at* 

    ```bash
    /mnt/beegfs/alphafold/databases
    ```

---

## Setting up Alphafold for the first time

1.  Clone this repository and `cd` into it.

    ```bash
    git clone https://github.com/deepmind/alphafold.git
    ```
1.  Build the Docker image (Need to be done only once):

    ```bash
    docker build -f docker/Dockerfile -t alphafold .
    ```

    If you encounter the following error:

    ```
    W: GPG error: https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A4B469963BF863CC
    E: The repository 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 InRelease' is not signed.
    ```

    Add the following line to the `docker/Dockerfile`:
    ```bash 
    RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
    ```

    If you encounter the following in Step 3/19:

    ```
    Step 3/9: ARG CUDA
    symlink /proc/mounts /mnt/beegfs/notos/docker/aufs/mnt/<long code> -inti/etc/mtab: device or resource is busy
    ```
    This means that all the disk space for docker is exhausted. Contact Dr. Christopher Paolini ([Email](paolini@engineering.sdsu.edu)) to add more disk space for docker. 

1.  Install the `run_docker.py` dependencies. Note: You may optionally wish to
    create a
    [Python Virtual Environment](https://docs.python.org/3/tutorial/venv.html)
    to prevent conflicts with your system's Python environment.

    ```bash
    pip3 install -r docker/requirements.txt
    ```

1. Open `docker/run_docker.py` and change the output directory `output_dir` to your choice of directory where you have sufficient permissions to write into it. 

1.  Run `run_docker.py` pointing to a FASTA file containing the protein
    sequence(s) for which you wish to predict the structure. If you are
    predicting the structure of a protein that is already in PDB and you wish to
    avoid using it as a template, then `max_template_date` must be set to be
    before the release date of the structure. You must also provide the path to
    the directory containing the downloaded databases. For example, for the
    T1050 CASP14 target:

    ```bash
    python3 docker/run_docker.py \
      --fasta_paths=T1050.fasta \
      --max_template_date=2020-05-14 \
      --data_dir=$DOWNLOAD_DIR
    ```

    The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`


    If you encounter the following error: 

    ```bash
    'Jackhmmer failed\nstderr:\n%s\n' % stderr.decode('utf-8'))
    RuntimeError: Jackhmmer failed 
    stderr:
    Fatal exception (source file esl_msafile_stockholm.c, line 1263):
    stockholm msa wrote failed 
    system error: No space left on device
    ```
    Contact Dr. Christopher Paolini ([Email](paolini@engineering.sdsu.edu)) to allocated more space in the docker:


    If you encounter the following error: 

    ```
    TypeError: Descriptors cannot not be created directly.
    If this call came from a _pb2.py file, your generated code is out of date and must be regenerated with protoc >= 3.19.0.
    If you cannot immediately regenerate your protos, some other possible workarounds are:
    1. Downgrade the protobuf package to 3.20.x or lower.
    2. Set PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python (but this will use pure-Python parsing and will be much slower).
    ```

    Do 
    ```bash
    pip3 install --upgrade protobuf==3.20.0
    ```
    And add the following line in `docker/run_docker.py` in the environmnet definition as shown below:

    ```python
    'PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION': 'python',
    ```

    ```python
    container = client.containers.run(
        image=FLAGS.docker_image_name,
        command=command_args,
        device_requests=device_requests,
        remove=True,
        detach=True,
        mounts=mounts,
        user=FLAGS.docker_user,
        environment={
            'NVIDIA_VISIBLE_DEVICES': FLAGS.gpu_devices,
            # The following flags allow us to make predictions on proteins that
            # would typically be too long to fit into GPU memory.
            'TF_FORCE_UNIFIED_MEMORY': '1',
            'XLA_PYTHON_CLIENT_MEM_FRACTION': '4.0',
            'PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION': 'python',
        })
    ```

    If you encounter the following error:
    ```bash
    RuntimeError: HHblits failed
    stdout:

    stderr:

    04:13:23.681 ERROR: Could find neither hhm_db nor a3m_db!
    ```
    It is due to the change in permissions. Do,

    ```bash
    sudo find /mnt/beegfs/alphafold/databases -type d -exec chmod 755 {} \;
    sudo find /mnt/beegfs/alphafold/databases -type f -exec chmod 644 {} \;
    ```
    If you don't have access to change permissions contact Dr. Christopher Paolini ([Email](paolini@engineering.sdsu.edu)).

---
        
## Running AlphaFold
1.  You can control which AlphaFold model to run by adding the
    `--model_preset=` flag.

    * **monomer**: This is the original model used at CASP14 with no ensembling.

    * **monomer\_casp14**: This is the original model used at CASP14 with
      `num_ensemble=8`, matching our CASP14 configuration. This is largely
      provided for reproducibility as it is 8x more computationally
      expensive for limited accuracy gain (+0.1 average GDT gain on CASP14
      domains).

    * **monomer\_ptm**: This is the original CASP14 model fine tuned with the
      pTM head, providing a pairwise confidence measure. It is slightly less
      accurate than the normal monomer model.

    * **multimer**: This is the [AlphaFold-Multimer](#citing-this-work) model.
      To use this model, provide a multi-sequence FASTA file. In addition, the
      UniProt database should have been downloaded.

1.  You can control MSA speed/quality tradeoff by adding
    `--db_preset=reduced_dbs` or `--db_preset=full_dbs` to the run command. The following presets are provided.

    *   **reduced\_dbs**: This preset is optimized for speed and lower hardware
        requirements. It runs with a reduced version of the BFD database.
        It requires 8 CPU cores (vCPUs), 8 GB of RAM, and 600 GB of disk space.

    *   **full\_dbs**: This runs with all genetic databases used at CASP14.

    Running the command above with the `monomer` model preset and the
    `reduced_dbs` data preset would look like this:

    ```bash
    python3 docker/run_docker.py \
      --fasta_paths=T1050.fasta \
      --max_template_date=2020-05-14 \
      --model_preset=monomer \
      --db_preset=reduced_dbs \
      --data_dir=$DOWNLOAD_DIR
    ```
    The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

--- 

## Running AlphaFold-Multimer

1. All steps are the same as when running the monomer system, but you will have to

    *   provide an input fasta with multiple sequences,
    *   set `--model_preset=multimer`,

    An example that folds a protein complex `multimer.fasta`:

    ```bash
    python3 docker/run_docker.py \
    --fasta_paths=multimer.fasta \
    --max_template_date=2020-05-14 \
    --model_preset=multimer \
    --data_dir=$DOWNLOAD_DIR
    ```
    The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

By default the multimer system will run 5 seeds per model (25 total predictions)
for a small drop in accuracy you may wish to run a single seed per model.  This
can be done via the `--num_multimer_predictions_per_model` flag, e.g. set it to
`--num_multimer_predictions_per_model=1` to run a single seed per model.

---

## Examples

Below are examples on how to use AlphaFold in different scenarios.

#### Folding a monomer

Say we have a monomer with the sequence `<SEQUENCE>`. The input fasta should be:

```fasta
>sequence_name
<SEQUENCE>
```

Then run the following command:

```bash
python3 docker/run_docker.py \
  --fasta_paths=monomer.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=monomer \
  --data_dir=$DOWNLOAD_DIR
```
The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

#### Folding a homomer

Say we have a homomer with 3 copies of the same sequence
`<SEQUENCE>`. The input fasta should be:

```fasta
>sequence_1
<SEQUENCE>
>sequence_2
<SEQUENCE>
>sequence_3
<SEQUENCE>
```

Then run the following command:

```bash
python3 docker/run_docker.py \
  --fasta_paths=homomer.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=multimer \
  --data_dir=$DOWNLOAD_DIR
```
The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

#### Folding a heteromer

Say we have an A2B3 heteromer, i.e. with 2 copies of
`<SEQUENCE A>` and 3 copies of `<SEQUENCE B>`. The input fasta should be:

```fasta
>sequence_1
<SEQUENCE A>
>sequence_2
<SEQUENCE A>
>sequence_3
<SEQUENCE B>
>sequence_4
<SEQUENCE B>
>sequence_5
<SEQUENCE B>
```

Then run the following command:

```bash
python3 docker/run_docker.py \
  --fasta_paths=heteromer.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=multimer \
  --data_dir=$DOWNLOAD_DIR
```
The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

#### Folding multiple monomers one after another

Say we have a two monomers, `monomer1.fasta` and `monomer2.fasta`.

Both can be folded sequentially by using the following command:

```bash
python3 docker/run_docker.py \
  --fasta_paths=monomer1.fasta,monomer2.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=monomer \
  --data_dir=$DOWNLOAD_DIR
```
The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

#### Folding multiple multimers one after another

Say we have a two multimers, `multimer1.fasta` and `multimer2.fasta`.

Both can be folded sequentially by using the following command:

```bash
python3 docker/run_docker.py \
  --fasta_paths=multimer1.fasta,multimer2.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=multimer \
  --data_dir=$DOWNLOAD_DIR
```
The `$DOWNLOAD_DIR` on notos for alphafold is `/mnt/beegfs/alphafold/databases`

---

## AlphaFold output

The outputs will be saved in a subdirectory of the directory provided via the
`--output_dir` flag of `run_docker.py` (defaults to `/tmp/alphafold/`). The
outputs include the computed MSAs, unrelaxed structures, relaxed structures,
ranked structures, raw model outputs, prediction metadata, and section timings.
The `--output_dir` directory will have the following structure:

```
<target_name>/
    features.pkl
    ranked_{0,1,2,3,4}.pdb
    ranking_debug.json
    relaxed_model_{1,2,3,4,5}.pdb
    result_model_{1,2,3,4,5}.pkl
    timings.json
    unrelaxed_model_{1,2,3,4,5}.pdb
    msas/
        bfd_uniclust_hits.a3m
        mgnify_hits.sto
        uniref90_hits.sto
```

The contents of each output file are as follows:

*   `features.pkl` – A `pickle` file containing the input feature NumPy arrays
    used by the models to produce the structures.
*   `unrelaxed_model_*.pdb` – A PDB format text file containing the predicted
    structure, exactly as outputted by the model.
*   `relaxed_model_*.pdb` – A PDB format text file containing the predicted
    structure, after performing an Amber relaxation procedure on the unrelaxed
    structure prediction (see Jumper et al. 2021, Suppl. Methods 1.8.6 for
    details).
*   `ranked_*.pdb` – A PDB format text file containing the relaxed predicted
    structures, after reordering by model confidence. Here `ranked_0.pdb` should
    contain the prediction with the highest confidence, and `ranked_4.pdb` the
    prediction with the lowest confidence. To rank model confidence, we use
    predicted LDDT (pLDDT) scores (see Jumper et al. 2021, Suppl. Methods 1.9.6
    for details).
*   `ranking_debug.json` – A JSON format text file containing the pLDDT values
    used to perform the model ranking, and a mapping back to the original model
    names.
*   `timings.json` – A JSON format text file containing the times taken to run
    each section of the AlphaFold pipeline.
*   `msas/` - A directory containing the files describing the various genetic
    tool hits that were used to construct the input MSA.
*   `result_model_*.pkl` – A `pickle` file containing a nested dictionary of the
    various NumPy arrays directly produced by the model. In addition to the
    output of the structure module, this includes auxiliary outputs such as:

    *   Distograms (`distogram/logits` contains a NumPy array of shape [N_res,
        N_res, N_bins] and `distogram/bin_edges` contains the definition of the
        bins).
    *   Per-residue pLDDT scores (`plddt` contains a NumPy array of shape
        [N_res] with the range of possible values from `0` to `100`, where `100`
        means most confident). This can serve to identify sequence regions
        predicted with high confidence or as an overall per-target confidence
        score when averaged across residues.
    *   Present only if using pTM models: predicted TM-score (`ptm` field
        contains a scalar). As a predictor of a global superposition metric,
        this score is designed to also assess whether the model is confident in
        the overall domain packing.
    *   Present only if using pTM models: predicted pairwise aligned errors
        (`predicted_aligned_error` contains a NumPy array of shape [N_res,
        N_res] with the range of possible values from `0` to
        `max_predicted_aligned_error`, where `0` means most confident). This can
        serve for a visualisation of domain packing confidence within the
        structure.

The pLDDT confidence measure is stored in the B-factor field of the output PDB
files (although unlike a B-factor, higher pLDDT is better, so care must be taken
when using for tasks such as molecular replacement).

---
## Running Multiple files on Alphafold

1. To start a screen session, type `screen` in your console:

```bash
$ screen 
```

1. To get a list of commands `Ctrl+a ?`

1. To create a named session
```bash
$ screen -S session_name 
```

Named sessions are useful when you run multiple screen sessions.

3. To detach from a Linux screen session, press `Ctrl+a d`

4. To reattach to a linux screen
```bash
$ screen -r
```
5. To get the list of current running session
```bash
$ screen -ls
``` 

More on GNU screen sessions can be found [here](https://linuxize.com/post/how-to-use-linux-screen/)

---

## References
- Jumper, John, Richard Evans, Alexander Pritzel, Tim Green, Michael Figurnov, Olaf Ronneberger, Kathryn Tunyasuvunakool, κ.ά. ‘Highly accurate protein structure prediction with AlphaFold’. Nature 596, τχ. 7873 (2021): 583–89. https://doi.org/10.1038/s41586-021-03819-2.

- Evans, Richard, Michael O\textquoterightNeill, Alexander Pritzel, Natasha Antropova, Andrew Senior, Tim Green, Augustin Žídek, κ.ά. ‘Protein complex prediction with AlphaFold-Multimer’. bioRxiv, 2021. https://doi.org/10.1101/2021.10.04.463034.

