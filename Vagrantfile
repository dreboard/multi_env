# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"
  #config.vm.network "forwarded_port", guest: 80, host: 8099
  config.vm.network :private_network, ip: "172.33.146.17"
  config.vm.synced_folder ".", "/var/www/dev", type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.gui = true
    vb.memory = "1024"
  end
  
  config.vm.provision "init", type: "shell", path: "./dev_ops/vagrant_conf/init.sh"
  config.vm.provision "apache", type: "shell", path: "./dev_ops/vagrant_conf/apache.sh"
  config.vm.provision "php", type: "shell", path: "./dev_ops/vagrant_conf/php.sh"
  config.vm.provision "extras", type: "shell", path: "./dev_ops/vagrant_conf/extras.sh"
  config.vm.provision "database", type: "shell", path: "./dev_ops/vagrant_conf/database.sh"

  config.vm.provision "shell", inline: <<-SHELL2
    echo -e "\n------------------------------------------- Composer install and config\n"
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    cd /vagrant && php composer.phar install
	#cd /vagrant && php codecept.phar bootstrap
    sudo cp /vagrant/dev_ops/git/post-merge.sh /vagrant/.git/hooks
  SHELL2

  config.vm.provision "bootstrap", type: "shell", path: "./dev_ops/vagrant_conf/run_always.sh", run: "always"

end