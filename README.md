# Basic Vagrant Box With Staging Subdomains

 Basic Ubuntu vagrant box with serveral subdomains to serve your:
  - development
  - staging
  - beta
 
 |Site          |Url                    |Branch|
 |--------------|------------|-----------|
 |development   |site.dev             |git branch develop
 |staging       |staging.site.dev     |git branch staging
 |beta          |beta.site.dev        |git branch beta
 
 ### Edit host file
 	172.33.146.17	site.dev
 	172.33.146.17	staging.site.dev
 	172.33.146.17	beta.site.dev
 
 Each box is aware of its own environment thru apache vhost file
 - `SetEnv APPLICATION_ENV "development"`
 - `SetEnv APPLICATION_ENV "staging"`
 - `SetEnv APPLICATION_ENV "beta"`
 
 Access with:
 `$_SERVER['APPLICATION_ENV']`
 
 ## GIT
 `cd /var/www/staging`
 `git init`
 `git checkout -b staging`
 
 
 ### Installed:
 - ubuntu/xenial64
 - Apache 2.4
 - PHP 7.1
 - Phpmyadmin
 - Composer
 - GIT
 
 ### Requirements
 - [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
 - [Vagrant](http://www.vagrantup.com/downloads)
 
 ### PHP Modules
 
 php7.1 php7.1-opcache php7.1-phpdbg php7.1-mbstring php7.1-cli php7.1-imap php7.1-ldap php7.1-pgsql php7.1-pspell php7.1-recode php7.1-snmp php7.1-tidy php7.1-dev php7.1-intl php7.1-gd php7.1-zip php7.1-xml php7.1-curl php7.1-json php7.1-mcrypt
 php7.1-intl php7.1-xsl php7.1-mysql