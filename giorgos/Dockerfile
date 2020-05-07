FROM jupyterlab-base:0.2

LABEL maintainter "Jupyter Lab for WML CE"

# Set conda exec
ENV CONDA=/opt/anaconda/condabin/conda

# Install Apt packages
RUN sudo apt update
RUN sudo apt install -y git

# Installl conda packages
# RUN sudo $CONDA install -y -c conda-forge jupyterlab-nvdashboard
# RUN $CONDA install -y -n wmlce -c conda-forge jupyterlab-nvdashboard
# RUN $CONDA install -y -n wmlce jupyterlab
RUN $CONDA install -y -n wmlce pytorch
RUN $CONDA install -y -n wmlce --channel-priority -c https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/ -c powerai -c defaults -c conda-forge transformers=2.5.1
RUN $CONDA install -y -n wmlce -c powerai tokenizers
RUN $CONDA install -y -n wmlce scikit-learn

# Set Jupyter executable location
ENV JUPYTER=/opt/anaconda/envs/wmlce/bin/jupyter

# Install pip packages
ENV PIP=/opt/anaconda/envs/wmlce/bin/pip
RUN $PIP install setuptools_rust

# Install rust from conda
RUN $CONDA install -y -n wmlce -c powerai rust-nightly

# Clone git repository for Simple Transformers
RUN which git

# Install the NVDashboard extension for Jupyter lab
# RUN $JUPYTER labextension install jupyterlab-nvdashboard

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
CMD ["./start.sh"]
