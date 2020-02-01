#!/usr/bin/env bash

apt-get update
apt-get install -y curl \
                   python3 \ 
                   python3-pip \
                   git \
                   wget

useradd --create-home --groups sudo --shell /bin/bash ansible

cp -r /home/vagrant/.ssh/ /home/ansible/

chown -R ansible /home/ansible/.ssh/
