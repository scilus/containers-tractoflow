FROM scilus/singularity-base-tractoflow:latest

ENV ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=8
ENV OPENBLAS_NUM_THREADS=1
ENV MATPLOTLIBRC="/usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/"
ENV LC_ALL=C

ADD human-data_master_1d3abfb.tar.bz2 /human-data

ENV LC_CTYPE="en_US.utf8"
ENV LC_ALL="en_US.utf8"
ENV LANG="en_US.utf8"
ENV LANGUAGE="en_US.utf8"
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/apt/*.bin
RUN apt update
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update

WORKDIR /
ENV PATH="/:${PATH}"
RUN apt -y install python3-pip
RUN apt -y install python3.7
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN update-alternatives --config python3
RUN update-alternatives  --set python3 /usr/bin/python3.7
RUN python3.7 -m pip install pip
RUN pip3 install --upgrade pip
RUN apt -y install python3.7-dev
RUN apt -y install unzip
RUN apt -y install python3.7-tk

WORKDIR /
ENV SCILPY_VERSION="1.1.0"
RUN wget https://github.com/scilus/scilpy/archive/${SCILPY_VERSION}.zip
RUN unzip ${SCILPY_VERSION}.zip
RUN mv scilpy-${SCILPY_VERSION} scilpy

WORKDIR /scilpy
RUN pip3 install -e .

RUN sed -i '41s/.*/backend : Agg/' /usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/matplotlibrc

WORKDIR /
