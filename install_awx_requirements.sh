#!/bin/bash

# Description: Vagrant Setup Ubuntu 18.04 LTS for Ansible with AWX Server
# Author: Benjamin P. Trachtenberg
# Version: 1.0.0
#
# Step 1:
#     Modify the following lines in /awx/installers/inventory
#
#     modify
#     postgres_data_dir=/tmp/pgdocker <- Base line
#     postgres_data_dir=/home/vagrant/pgdocker <- Change it to this
#
#     uncomment
#     docker_compose_dir=/var/lib/awx
#
# Step 2:
#     Run the following command from /awx/installers directory
#     ansible-playbook -i inventory install.yml
#
apt-get update
# Add needed packages to get this to work
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
# Add docker-ce repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
#  Add Ansilbe Repo
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
# Update and install Ansible, and Docker
apt-get update
apt-get install -y \
    ansible \
    docker-ce \
    docker-compose \
    python-pip \
    git \
    nodejs \
    npm
apt-get upgrade -y
apt-get clean
# Commented out do to issues in current pip version
# pip install --upgrade pip
pip install --upgrade docker-compose
pip uninstall -y docker
pip install docker
usermod -aG docker ubuntu
usermod -aG docker vagrant
npm install npm --global
# Clone the AWX repository
git clone https://github.com/ansible/awx.git /home/vagrant/awx
# Change ownership of directories
chown vagrant -R /home/vagrant/*
chgrp vagrant -R /home/vagrant/*
