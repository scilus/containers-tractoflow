FROM scilus/singularity-base-tractoflow:latest AS dependencies
FROM scilus/docker-vtk-8.2.0:latest

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
RUN apt -y install language-pack-en
RUN apt -y install libblas-dev liblapack-dev gfortran
RUN apt -y install software-properties-common
RUN apt install -y libeigen3-dev
RUN apt install -y libqt4-opengl-dev
RUN apt install -y libgl1-mesa-dev
RUN apt install -y libfftw3-dev
RUN apt install -y libtiff5-dev
RUN apt install -y clang

COPY --from=dependencies /mrtrix3 ./mrtrix3
ENV PATH=/mrtrix3/bin:$PATH

RUN add-apt-repository ppa:deadsnakes/ppa
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt update
RUN apt -y install fonts-freefont-ttf
RUN apt -y install openjdk-11-jdk curl

WORKDIR /
RUN apt -y install wget
RUN wget https://github.com/nextflow-io/nextflow/releases/download/v19.04.0/nextflow-19.04.0-all && mv nextflow-19.04.0-all nextflow && chmod +x nextflow
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

# Install SCILPY
WORKDIR /
ENV SCILPY_VERSION="master"
RUN wget https://github.com/scilus/scilpy/archive/${SCILPY_VERSION}.zip
RUN unzip ${SCILPY_VERSION}.zip
RUN mv scilpy-${SCILPY_VERSION} scilpy
RUN rm -rf ${SCILPY_VERSION}.zip

WORKDIR /scilpy
ENV MATPLOTLIBRC="/usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/"
RUN pip3 install -e .

# Install TRACTOFLOW
WORKDIR /
ENV TRACTOFLOW_VERSION="master"

RUN wget https://github.com/scilus/tractoflow/archive/${TRACTOFLOW_VERSION}.zip
RUN unzip ${TRACTOFLOW_VERSION}.zip
RUN mv tractoflow-${TRACTOFLOW_VERSION} tractoflow

WORKDIR /
RUN git clone https://github.com/GuillaumeTh/dmriqcpy.git
WORKDIR /dmriqcpy
RUN pip3 install git+https://github.com/scilus/scilpy.git#egg=scilpy
RUN pip3 install git+https://github.com/GuillaumeTh/dmriqcpy.git
RUN pip3 uninstall -y vtk

# MATPLOTLIBRC

RUN sed -i '41s/.*/backend : Agg/' /usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/matplotlibrc
# Use offscreen backend
# RUN echo "backend : Agg" > /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/matplotlibrc

WORKDIR /
