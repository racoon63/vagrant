#!/usr/bin/env bash

set -e

LOGFILE=./vagrant.log
exec &> >(tee -a "$LOGFILE")

echo -e "\033[1;33m==========> Bringup CentOS 7 Template <==========\033[0m"
vagrant up

echo -e "\033[1;33m==========> Shutdown CentOS 7 Template VM <==========\033[0m"
vagrant halt centos-7-template

echo -e "\033[1;33m==========> Package CentOS 7 Template to a Vagrant Box <==========\033[0m"
vagrant package --base centos-7-template \
                --output centos-7-template.box \
                --include info.json \
                --vagrantfile Vagrantfile \
                centos-7-template

echo -e "\033[1;33m==========> Import CentOS 7 Template as a Vagrant Box <==========\033[0m"
vagrant box add --clean \
                --provider virtualbox \
                --name racoon63/centos7 \
                --force \
                centos-7-template.box

echo -e "\033[1;33m==========> Cleanup <==========\033[0m"
VBoxManage unregistervm centos-7-template --delete

read -p "Do you want to delete the local box file? [Y/n]: " DELBOX

if [[ $DELBOX == 'y' || $DELBOX == 'Y' || $DELBOX == '' ]]
then
    rm -f centos-7-template.box
fi
