#!/usr/bin/env bash

cd ~/
git clone https://github.com/NVIDIA/DIGITS.git
cd DIGITS
git checkout v3.2.0
echo '[DIGITS]' >> digits/digits.cfg
echo 'caffe_root = /home/ubuntu/caffe' >> digits/digits.cfg

if hash conda 2>/dev/null ; then
    conda install -y protobuf flask-wtf gevent
    # pip install lmdb flask-socketio pydot2 gunicorn==17.5
    pip install -r requirements.txt
else
    sudo pip install -r requirements.txt
fi

sudo apt-get install -y graphviz
sudo ln /dev/null /dev/raw1394
