#!/usr/bin/env bash

set -e

echo -e "\033[1;33m===> Shutdown nodes...\033[0m"
vagrant destroy -f

echo -e "\033[1;33m===> Cleanup network...\033[0m"
VBoxManage natnetwork remove --netname dev-net
