#!/usr/bin/env bash

echo -e "\033[1;33mCreating dev-net network...\033[0m"
if [[ $(VBoxManage list natnets | grep "dev-net") ]]
then 
    echo -e "\033[1;31mNetwork already exists\033[0m"
else
    VBoxManage natnetwork add --netname dev-net \
                              --network 10.10.10.0/24 \
                              --enable \
                              --dhcp off \
                              --ipv6 off
fi

echo -e "\033[1;33mBringup nodes...\033[0m"
vagrant up

echo -e "\033[1;33mLogin to first node...\033[0m"
vagrant ssh node1
