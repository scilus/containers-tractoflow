This repository is not used anymore. 
Please use: https://github.com/scilus/containers-scilus


[![GitHub release (latest by date)](https://img.shields.io/github/v/release/scilus/containers-tractoflow)](https://github.com/scilus/containers-tractoflow/releases)
[![Build Status](https://travis-ci.org/scilus/containers-tractoflow.svg?branch=master)](https://travis-ci.org/scilus/containers-tractoflow)

Containers related files for TractoFlow
=======================================

Containers update
-----------------
When updating `Scilpy`, you will need to modify the SHA of the file, as well as
the `SCILPY_VERSION` variable in `Dockerfile`.

When updating `TractoFlow`, you will need to modify the SHA of the file, as well as
the `TRACTOFLOW_VERSION` variable in `Dockerfile`.

Docker
------
To build the docker use the following command:

`sudo docker build -t docker_tractoflow .`

Singularity
-----------
The image for Singularity can be built using `singularity_tractoflow.def` with the command:
`sudo singularity build image_name.img singularity_tractoflow.def`.

Singularity container is built from the Docker stored on dockerhub.

It can be used to run the TractoFlow pipeline with the option
`-with-singularity image_name.img` of Nextflow.

If you use this singularity, please cite:

```
Kurtzer GM, Sochat V, Bauer MW (2017)
Singularity: Scientific containers for mobility of compute.
PLoS ONE 12(5): e0177459. https://doi.org/10.1371/journal.pone.0177459
```
 
