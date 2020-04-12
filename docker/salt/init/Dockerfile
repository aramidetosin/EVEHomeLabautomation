# Build salt master image for use in EVE

FROM ubuntu:xenial

MAINTAINER aramide
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install xinetd telnetd
RUN touch /etc/xinetd.d/telnet
RUN echo "service telnet{\ndisable = no\nflags = REUSE\nsocket_type = stream\nwait = no\nuser = root\nserver = /usr/sbin/in.telnetd\nlog_on_failure += USERID\n}" >> /etc/xinetd.d/telnet
RUN service xinetd restart

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install apt-utils sudo wget openssh-server python3 \
    gnupg git iputils-ping net-tools traceroute mtr vim python3-pip\
    && rm -rf /var/lib/apt/lists/*

# Set up Napalm

RUN pip3 install --upgrade pip

RUN pip3 install napalm

# Run the following command to import the SaltStack repository key

RUN wget -O - https://repo.saltstack.com/py3/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

RUN touch /etc/apt/sources.list.d/saltstack.list

RUN echo "deb http://repo.saltstack.com/py3/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/sources.list.d/saltstack.list

RUN apt-get update && apt-get -y install salt-master salt-minion

RUN echo "master: 127.0.0.1" >> /etc/salt/minion

VOLUME [ "/etc/salt", "/var/cache/salt", "/var/log/salt", "/var/run/salt" ]

RUN service salt-master start

RUN service salt-minion start

RUN salt-key -y -A


# Set up SSH

RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults

RUN chmod a-w /etc/ssh/sshd_config.factory-defaults

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN service ssh start