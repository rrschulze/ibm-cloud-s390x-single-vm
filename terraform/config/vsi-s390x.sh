#!/usr/bin/env bash
set -Eeuo pipefail

#install git, make and gcc
apt update
apt -y install git
apt -y install make
apt -y install gcc
apt -y install g++
apt -y install build-essential
apt -y install maven
apt -y install cmake

#install docker and docker compose
#apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get -y install ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# requirements for building open-telemetry-cpp
apt -y install libprotobuf-dev protobuf-compiler
apt -y install curl
apt -y install libcurl4-openssl-dev

apt -y install libgtest-dev
cd /usr/src/googletest
cmake .
cmake --build . --target install

git clone https://github.com/google/benchmark.git
mkdir benchmark-build
cd benchmark-build
cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/../benchmark-install ../benchmark
make install

#create user labuser
adduser --disabled-password --gecos "" labuser 
usermod -aG sudo labuser
echo 'labuser  ALL= NOPASSWD: /usr/bin/add-apt-repository, /usr/bin/apt, /usr/bin/snap, /usr/bin/docker, /usr/bin/update-alternatives, /usr/bin/python, /usr/local/bin/pip' | sudo EDITOR='tee -a' visudo
mkdir /home/labuser/.ssh
cp /root/.ssh/authorized_keys /home/labuser/.ssh/authorized_keys
chown labuser -R /home/labuser/.ssh/
chgrp labuser -R /home/labuser/.ssh/
chmod 700 /home/labuser/.ssh
chmod 600 /home/labuser/.ssh/authorized_keys

#install tools
apt -y install vim
