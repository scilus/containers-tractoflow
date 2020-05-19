[![Build Status](https://travis-ci.org/scilus/containers-tractoflow.svg?branch=master)](https://travis-ci.org/scilus/containers-tractoflow)

Singularity related files for TractoFlow
----------------------------------------

The image for singularity can be built using `singularity_tractoflow.def` with the command:
`sudo singularity build image_name.img singularity_tractoflow.def`.

It can be used to run the TractoFlow pipeline with the option
`-with-singularity image_name.img` of Nextflow.

When updating `Scilpy`, you will need to modify the SHA of the file, as well as
the `SCILPY` variable in `singularity_tractoflow.def`.

To build the singularity, please run the command from the directory `singularity-tractoflow`.
Otherwise, `Scilpy` archive will not be found.

If you use this singularity, please cite:

```
Kurtzer GM, Sochat V, Bauer MW (2017)
Singularity: Scientific containers for mobility of compute.
PLoS ONE 12(5): e0177459. https://doi.org/10.1371/journal.pone.0177459
```
 
