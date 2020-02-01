#!/usr/bin/env bash

# Update and install basic tools
yum update -y
yum install -y curl \
               git \
               python3 \
               python3-pip \
               wget

# Install virtualbox guest additions
wget http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_4.3.8.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_4.3.8.iso
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions

# create a user for ansible
useradd --create-home --groups vagrant --shell /bin/bash --user-group ansible
cp -r /home/vagrant/.ssh/ /home/ansible/
chown -R ansible /home/ansible/.ssh/
