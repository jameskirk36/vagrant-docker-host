#!/usr/bin/env bash

apt-get update
apt-get install -y ansible

ansible-galaxy install amidos.install-docker
echo '[local]\nlocalhost' > /etc/ansible/hosts

ansible-playbook /vagrant/docker.yml
