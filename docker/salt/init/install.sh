sudo apt-get -qq update apt-get -y install apt-utils sudo wget openssh-server python3 gnupg git iputils-ping net-tools traceroute mtr vim python3-pip tree  && rm -rf /var/lib/apt/lists/*

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
touch /etc/apt/sources.list.d/saltstack.list
echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" >> /etc/apt/sources.list.d/saltstack.list
sudo apt-get update && apt-get -y install salt-master salt-minion
echo "master: 127.0.0.1" >> /etc/salt/minion
touch /etc/salt/proxy
echo "master: localhost\npki_dir: /etc/salt/pki/proxy\ncache_dir: /var/cache/salt/proxy\nmultiprocessing: False" >> /etc/salt/proxy
salt-master -d
salt-minion -d

sudo pip3 install --upgrade pip
sudo pip3 install napalm
sudo pip3 install jxmlease