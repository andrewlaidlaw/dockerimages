#!/bin/bash

# conda install -y jupyterlab

sudo mkdir /data
sudo chown pwrai:pwrai /data
cd /data

mkdir ~/.jupyter
echo '{"NotebookApp": {"password": "sha1:2d514f331d8d:7859221281ed6c9b53e2940af3a82d029e116ca8"}}' > ~/.jupyter/jupyter_notebook_config.json

/opt/anaconda/envs/wmlce/bin/jupyter lab --no-browser --port=8888 --ip=0.0.0.0
