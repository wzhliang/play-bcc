#!/bin/sh
sudo sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list
sudo apt update
sudo apt -y install bpfcc-tools linux-headers-$(uname -r)
