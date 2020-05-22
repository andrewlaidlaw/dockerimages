#!/bin/bash

# conda install -y jupyterlab

sudo mkdir /data
sudo chown pwrai:pwrai /data
cd /data

mkdir ~/.jupyter
echo $JUPYTERPASSWORD
export PASSWD=$(/opt/anaconda/envs/wmlce/bin/python -c 'from notebook.auth import passwd; print(passwd("$JUPYTERPASSWORD"))')
echo $PASSWD
# echo '{"NotebookApp": {"password": "'$PASSWD'"}}' > ~/.jupyter/jupyter_notebook_config.json
echo '{"NotebookApp": {"password": "sha1:63f3699e63b9:7a86bfe70e997dacf1ee95f5ea92c2758d5218b9"}}' > ~/.jupyter/jupyter_notebook_config.json

cat ~/.jupyter/jupyter_notebook_config.json

/opt/anaconda/envs/wmlce/bin/jupyter lab --no-browser --port=8888 --ip=0.0.0.0
