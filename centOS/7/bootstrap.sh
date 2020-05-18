#!/usr/bin/env bash

# ===== Update and install basic packages =====
yum update -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y curl \
               git \
               python3 \
               python3-pip \
               wget \
               yum-utils
yum install -y docker-ce \
               docker-ce-cli \
               containerd.io

# ===== Setup docker service on system startup =====
systemctl enable docker
usermod -aG docker vagrant

# ===== Create a user for ansible =====
useradd --create-home --groups vagrant --shell /bin/bash --user-group ansible
cp -r /home/vagrant/.ssh/ /home/ansible/
chown -R ansible /home/ansible/.ssh/

# ===== Install custom virtualbox guest additions version =====
# VBoxGuestAdditions_version="6.0.20" # from: https://download.virtualbox.org/virtualbox/
# wget http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
# mkdir /media/VBoxGuestAdditions
# mount -o loop,ro VBoxGuestAdditions_4.3.8.iso /media/VBoxGuestAdditions
# sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
# rm VBoxGuestAdditions_4.3.8.iso
# umount /media/VBoxGuestAdditions
# rmdir /media/VBoxGuestAdditions
