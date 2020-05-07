FROM ibmcom/powerai:1.7.0-base-ubuntu18.04-py36

LABEL maintainter "Jupyter Lab for WML CE"

# Set conda exec
ENV CONDA=/opt/anaconda/condabin/conda

# Install Apt packages
# RUN sudo apt update
# RUN sudo apt install -y gcc g++

# Installl Jupyter
# RUN sudo $CONDA install -y -c conda-forge jupyterlab-nvdashboard
RUN $CONDA install -y -n wmlce jupyter jupyterlab
# RUN $CONDA install -y -n wmlce nodejs
# RUN $CONDA install -y -n wmlce -c conda-forge jupyterlab-nvdashboard

# Set Jupyter executable location
# ENV JUPYTER=/opt/anaconda/envs/wmlce/bin/jupyter

# Install pip packages
# ENV PIP=/opt/anaconda/envs/wmlce/bin/pip
# RUN $PIP install jupyterlab-nvdashboard

# Install the NVDashboard extension for Jupyter lab
# RUN $JUPYTER labextension install jupyterlab-nvdashboard

# Copy startup script
COPY start.sh .
RUN sudo chmod +x start.sh

# Variables
# ENV HOME /data

# Accept the PowerAI license
ENV LICENSE=yes
ENV IBM_POWERAI_LICENSE_ACCEPT=yes

# Open the Jupyter notebook port
EXPOSE 8888

# Run the start up script
CMD ["./start.sh"]
