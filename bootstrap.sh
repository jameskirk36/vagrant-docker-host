#!/usr/bin/env bash

function main(){
  sudo apt-get update
  sudo apt-get install -y ansible
  
  sudo ansible-galaxy install amidos.install-docker

  cp -f /vagrant/ansible.cfg /home/vagrant/.ansible.cfg
  
  sudo rm -f /etc/ansible/hosts
  sudo sh -c 'echo "[local]" >> /etc/ansible/hosts;echo "localhost" >> /etc/ansible/hosts'
  
  cp -f /vagrant/.vagrant/machines/default/virtualbox/private_key /home/vagrant/.ssh/vagrant_private_key
  chmod 600 /home/vagrant/.ssh/vagrant_private_key
  
  ansible-playbook /vagrant/docker.yml --private-key=/home/vagrant/.ssh/vagrant_private_key
  #smoke test!
  docker --version
}

uid=$(id -u)
if [ $uid -eq 0 ]; then
  echo "Switching to user: vagrant"
  sudo -u vagrant -i $0 "$@"  
else
  main
fi
