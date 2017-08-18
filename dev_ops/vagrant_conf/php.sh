#!/usr/bin/env bash

	echo -e "\n------------------------------------------- Installing PHP\n"
	sudo apt-get purge php.*

    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    
    sudo apt-get install -y php7.1 php7.1-opcache php7.1-phpdbg php7.1-mbstring php7.1-cli php7.1-imap php7.1-ldap php7.1-pgsql php7.1-pspell php7.1-recode php7.1-snmp php7.1-tidy php7.1-dev php7.1-intl php7.1-gd php7.1-zip php7.1-xml php7.1-curl php7.1-json php7.1-mcrypt
    sudo apt-get install php7.1-intl php7.1-xsl
    sudo apt-get install -y php7.1-mysql
	sudo apt-get -y install libapache2-mod-php7.1
	
    echo -e "\n--- Installing Xdebug ---\n"
    sudo apt-get install -y php-xdebug
    sudo cp /vagrant/dev_ops/apache/20-xdebug.ini /etc/php/7.1/cli/conf.d

    # Set up profiler for development only
	if [ -d "/var/www/dev/temp/debug" ]; then
        mkdir "/var/www/dev/temp/debug"
      else
        rm -rf "/var/www/dev/temp/debug/*"
    fi

