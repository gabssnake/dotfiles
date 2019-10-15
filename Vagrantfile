# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.network "private_network", ip: "192.168.10.10"
  config.vm.network "public_network", bridge: "en1: Wi-Fi (Wireless)"

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive

    # Change root password (lol)
    echo 'root:root' | chpasswd

    # Allow root SSH
    sed -i "s/PasswordAuthentication no/PasswordAuthentication yes\\n\
    PermitRootLogin yes/" /etc/ssh/sshd_config
    service sshd restart

    # Install basic stuff
    apt-get update > /dev/null
    apt-get install -y zsh vim tmux git > /dev/null

    # Azerty keyboard crazyness
    sudo setxkbmap fr
    sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"fr\"/g' /etc/default/keyboard
  SHELL

  config.vm.post_up_message = %{
    - 192.168.10.10
    - root:root
    - vagrant:vagrant
  }

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # config.vm.synced_folder "../data", "/vagrant_data"
end
