#!/bin/bash

cat <<EOM
Salt/NAPALM installation script
==================================
This script updates your system, installs additional APT and PIP
packages, and installs Salt with NAPALM.
The script was adapted for and tested on Ubuntu 18.04. Do not use it
on earlier versions of Ubuntu.
==================================
EOM

echo "Update installed software to latest release (might take a long time)"
sudo apt-get update
echo "Install nice-to-have packages and Install Python development and build modules"
sudo apt-get -y install apt-utils sudo wget openssh-server python3 gnupg git iputils-ping net-tools traceroute mtr vim python3-pip tree
sudo rm -rf /var/lib/apt/lists/*

echo "Install and configure salt-master and salt-minion"
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/saltstack.list
sudo echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" >> /etc/apt/sources.list.d/saltstack.list
sudo apt-get update && apt-get -y install salt-master salt-minion
sudo echo "master: 127.0.0.1" >> /etc/salt/minion
sudo touch /etc/salt/proxy
sudo echo "
master: localhost
pki_dir: /etc/salt/pki/proxy
cache_dir: /var/cache/salt/proxy
multiprocessing: False" >> /etc/salt/proxy
sudo salt-master -d
sudo salt-minion -d

echo "Enable ssh rootLogin"
sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
sudo service ssh start

sudo pip3 install --upgrade pip
echo "Installing NAPALM dependencies"
sudo pip3 install napalm
sudo pip3 install jxmlease

echo "Installation complete. Let's test Saltstack version"
echo
salt --version