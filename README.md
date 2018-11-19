# awx_vagrant
A Ubuntu 18.04 LTS Prepped for AWX (Ansible-Tower Open Source)

# Some Directions
* Modify the ip so you can use it
* The lowest memory you should use for install is 4096
```ruby
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
```
* Install directions, this is also located in the shell script
```shell
# Step 1:
#     Modify the following lines in /awx/installers/inventory
#
#     modify
#     postgres_data_dir=/tmp/pgdocker <- Base line
#     postgres_data_dir=/home/vagrant/pgdocker <- Change it to this
#
#     uncomment
#     docker_compose_dir=/var/lib/awx
#
# Step 2:
#     Run the following command from /awx/installers directory
#     ansible-playbook -i inventory install.yml
#
```
