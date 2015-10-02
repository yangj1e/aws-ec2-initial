#!/bin/bash

cd ~/
git clone https://github.com/NVIDIA/DIGITS.git

if hash conda 2>/dev/null ; then
    conda install -y protobuf flask-wtf gunicorn pydot
    pip install lmdb flask-socketio
else
    cd DIGITS/
    pip install -r requirements.txt
fi

sudo apt-get install -y graphviz
