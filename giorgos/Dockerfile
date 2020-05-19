FROM jupyterlab-base:0.2

LABEL maintainter "Jupyter Lab for WML CE"

# Set conda exec
ENV CONDA=/opt/anaconda/condabin/conda

# Install Apt packages
RUN sudo apt-get update
RUN sudo apt install -y git build-essential
RUN sudo apt install -y openssl

# Installl conda packages
# RUN sudo $CONDA install -y -c conda-forge jupyterlab-nvdashboard
# RUN $CONDA install -y -n wmlce -c conda-forge jupyterlab-nvdashboard
# RUN $CONDA install -y -n wmlce jupyterlab
RUN $CONDA install -y pytorch
# RUN $CONDA install -y -n wmlce --channel-priority -c https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/ -c powerai -c defaults -c conda-forge transformers
# RUN $CONDA install -y -n wmlce -c powerai tokenizers
RUN $CONDA install -y scikit-learn pkgconfig h5py cython
RUN $CONDA install -y -c powerai rust-nightly

# Set Jupyter executable location
ENV JUPYTER=/opt/anaconda/bin/jupyter

# Install pip packages
ENV PIP=/opt/anaconda/bin/pip
RUN $PIP install tokenizers==0.52 transformers==2.6.0
RUN $PIP install setuptools_rust

# Clone git repository for Simple Transformers
RUN $CONDA install -y git
ENV GIT=/opt/anaconda/bin/git
ENV PYTHON=/opt/anaconda/bin/python

RUN sudo mkdir simpletransformers
RUN sudo chown pwrai:pwrai simpletransformers
RUN $GIT clone https://github.com/ThilinaRajapakse/simpletransformers.git

# RUN $PIP install tokenizers
# RUN $PIP install -y rust

RUN ls -al simpletransformers
WORKDIR simpletransformers
COPY setup.py .
RUN cat setup.py

RUN $PYTHON setup.py build
RUN $PYTHON setup.py install

# Copy startup script
COPY start.sh .
RUN sudo chmod +x start.sh

# Variables
ENV HOME /data

# Accept the PowerAI license
ENV LICENSE=yes
ENV IBM_POWERAI_LICENSE_ACCEPT=yes

# Open the Jupyter notebook port
EXPOSE 8888

# Run the start up script
# CMD ["./start.sh"]
