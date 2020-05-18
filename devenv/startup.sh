#!/usr/bin/env bash

set -e

echo -e "\033[1;33m===> Creating dev-net network...\033[0m"
if [[ $(VBoxManage list natnets | grep "dev-net") ]]
then 
    echo -e "\033[1;31m===> Network already exists\033[0m"
else
    VBoxManage natnetwork add --netname dev-net \
                              --network 10.10.10.0/24 \
                              --enable \
                              --dhcp off \
                              --ipv6 off
fi

echo -e "\033[1;33m===> Bringup nodes...\033[0m"
vagrant up

echo -e "\033[1;33m===> Login to node1...\033[0m"
vagrant ssh node1
