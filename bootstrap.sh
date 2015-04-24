#!/usr/bin/env bash

apt-get update
apt-get install -y ansible

ansible-galaxy install amidos.install-docker
ansible-galaxy install dav1d8.docker-compose

if [ ! -f /etc/ansible/hosts ]; then
    echo '[local]\nlocalhost' > /etc/ansible/hosts
fi

ansible-playbook /vagrant/docker.yml
