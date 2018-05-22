Singularity related files for Human-NF
--------------------------------------

The image for singularity can be built using _singularity_human.def_ with the command:
`sudo singularity build image_name.img singularity_human.def`.

It can be used to run the Human-NF pipeline with the option
`-with-singularity image_name.img` of Nextflow.

To build the singularity, please run the command from the directory `singularity-human`.
Otherwise, `scilpy.tar` is not found.

If you use this singularity, please cite:

```
Kurtzer GM, Sochat V, Bauer MW (2017)
Singularity: Scientific containers for mobility of compute.
PLoS ONE 12(5): e0177459. https://doi.org/10.1371/journal.pone.0177459
```
 