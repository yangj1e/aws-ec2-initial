#!/bin/bash

sudo locale-gen en_AU.UTF-8
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y -q zsh git zip unzip build-essential htop
sudo apt-get clean

sudo passwd ubuntu
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i '/^ZSH_THEME="robbyrussell"/s/robbyrussell/clean/' ~/.zshrc
chsh -s $(which zsh)

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
bash Anaconda-2.3.0-Linux-x86_64.sh -b
echo 'export PATH="/home/ubuntu/anaconda/bin:$PATH"' >> ~/.zshrc

# mkdir mount_point
# sudo mount /dev/xvdf mount_point
# chown ubuntu:ubuntu mount_point
