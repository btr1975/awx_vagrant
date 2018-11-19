# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.define "my-awx-server" do |awx|
        awx.vm.box = "ubuntu/bionic64"
        awx.vm.hostname = "my-awx-server"
        awx.vm.network "public_network", ip: "192.168.1.70"
        config.vm.provider "virtualbox" do |v|
            v.cpus = 1
            v.memory = 4096
            v.name = "my-awx-server"
        end
        awx.vm.provision :shell, path: "install_awx_requirements.sh"
    end
end

