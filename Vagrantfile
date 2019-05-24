# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "nomad"

  # disable logs and increase resources
  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    vb.memory = 4096
    vb.cpus = 4
  end

  # Prereqs
  config.vm.provision "shell", inline: "apt install unzip"

  # Terraform
  config.vm.provision "shell", inline: "wget -q -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.0-beta1/terraform_0.12.0-beta1_linux_amd64.zip"
  config.vm.provision "shell", inline: "unzip /tmp/terraform.zip -d /usr/local/bin/"

end
