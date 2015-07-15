# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  # networking 
  config.vm.hostname = "docker-host"
  config.vm.network "forwarded_port" ,guest: 32768, host: 32768
  config.vm.network "forwarded_port" ,guest: 8153, host: 8153

  # provisioning
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.synced_folder "C:/src", "/home/vagrant/src"
end
