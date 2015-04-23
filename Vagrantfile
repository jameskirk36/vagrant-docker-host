# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # networking 
  config.vm.hostname = "docker-host"

  # provisioning
  config.vm.provision :shell, path: "bootstrap.sh"
end
