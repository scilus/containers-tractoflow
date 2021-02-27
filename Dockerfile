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
RUN add-apt-repository ppa:openjdk-r/ppa
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
RUN pip3 install bz2file==0.98
RUN pip3 install coloredlogs==10.0
RUN pip3 install cycler==0.10.0
RUN pip3 install Cython==0.29.12
# Fix bug in the dipy release
RUN pip3 install git+https://github.com/dipy/dipy.git@5e4adff8b1d86210a683b84034c18e388914a09e
RUN pip3 install fury==0.2.0
RUN pip3 install future==0.17.1
RUN pip3 install h5py==2.9.0
RUN pip3 install kiwisolver==1.0.1
RUN pip3 install matplotlib==2.2.2
RUN pip3 install nibabel==3.0.1
RUN pip3 install nilearn==0.6.1
RUN pip3 install numpy==1.18.4
RUN pip3 install Pillow==6.2.2
RUN pip3 install pybids==0.10.2
RUN pip3 install pyparsing==2.2.0
RUN pip3 install python-dateutil==2.7.2
RUN pip3 install pytz==2018.4
RUN pip3 install scikit-learn==0.22.1
RUN pip3 install scipy==1.4.1
RUN pip3 install setuptools==46.1.3
RUN pip3 install six==1.15.0
RUN pip3 install vtk==8.1.2
RUN pip install trimeshpy==0.0.2
RUN pip3 install coloredlogs==10.0
RUN pip3 install nilearn==0.6.1
RUN pip3 install pytest==5.3.5
RUN pip3 install pytest_console_scripts==0.2.0
RUN pip3 install bctpy==0.5.2
RUN pip3 install statsmodels==0.11.1
RUN pip3 install dmri-commit==1.3.8.9
ENV MATPLOTLIBRC="/usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/"
RUN python3 setup.py build_ext --inplace
RUN python3 setup.py install
RUN python3 setup.py install_scripts

RUN sed -i '41s/.*/backend : Agg/' /usr/local/lib/python3.7/dist-packages/matplotlib/mpl-data/matplotlibrc

WORKDIR /
