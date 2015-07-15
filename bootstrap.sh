#!/usr/bin/env bash

function install_docker(){
  sudo ansible-galaxy install amidos.install-docker

  cp -f /vagrant/ansible.cfg /home/vagrant/.ansible.cfg
  
  sudo rm -f /etc/ansible/hosts
  sudo sh -c 'echo "[local]" >> /etc/ansible/hosts;echo "localhost" >> /etc/ansible/hosts'
  
  cp -f /vagrant/.vagrant/machines/default/virtualbox/private_key /home/vagrant/.ssh/vagrant_private_key
  chmod 600 /home/vagrant/.ssh/vagrant_private_key
  
  ansible-playbook /vagrant/docker.yml --private-key=/home/vagrant/.ssh/vagrant_private_key
}

function install_docker_compose(){
  curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

function main(){
  sudo apt-get update
  sudo apt-get install -y ansible
  
  install_docker  

  #smoke test!
  docker --version
}

uid=$(id -u)
if [ $uid -eq 0 ]; then
  install_docker_compose  

  echo "Switching to user: vagrant"
  sudo -u vagrant -i $0 "$@"
else
  main
fi
