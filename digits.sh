#!/bin/bash

cd ~/
git clone https://github.com/NVIDIA/DIGITS.git

conda install -y protobuf flask-wtf gunicorn pydot
pip install lmdb flask-socketio

sudo apt-get install -y graphviz
