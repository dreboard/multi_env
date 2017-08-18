#!/usr/bin/env bash

echo -e "\n------------------------------------------- Installing Apache\n"
sudo apt-get install -y apache2
sudo a2enmod rewrite

echo -e "\n------------------------------------------- Configure Domains\n"	
# configure development
	if [ -d "/var/www/dev" ]; then
        sudo mkdir "/var/www/dev"
		sudo chmod -R 755 /var/www/dev
		sudo mkdir "/var/www/dev/logs"
		sudo mkdir "/var/www/dev/temp/debug"
    fi

# configure staging
	if [ -d "/var/www/staging" ]; then
        sudo mkdir "/var/www/staging"
		sudo chmod -R 755 /var/www/staging
		sudo mkdir "/var/www/staging/public"
		sudo mkdir "/var/www/staging/logs"
    fi
	
# configure beta
	if [ -d "/var/www/beta" ]; then
        sudo mkdir "/var/www/beta"
		sudo chmod -R 755 /var/www/beta
		sudo mkdir "/var/www/staging/public"
		sudo mkdir "/var/www/beta/logs"
    fi
	
# setup hosts files
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerName site.dev
    ServerAlias www.site.dev
    DocumentRoot "/var/www/dev/public"
    SetEnv APPLICATION_ENV "development"
    SetEnv APPLICATION_NAME "dev_env"
    ServerAdmin dre.board@gmail.com
    ErrorLog /var/www/dev/logs/error.log
	CustomLog /var/www/dev/logs/access.log combined
    <Directory "/var/www/dev/public">
            Options +Indexes +FollowSymLinks
            AllowOverride All
            Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

VHOST2=$(cat <<EOF
<VirtualHost *:80>
    ServerName staging.site.dev
    ServerAlias www.staging.site.dev
    DocumentRoot "/var/www/staging/public"
    SetEnv APPLICATION_ENV "staging"
    SetEnv APPLICATION_NAME "stage_env"
    ServerAdmin dre.board@gmail.com
    ErrorLog /var/www/staging/logs/error.log
	CustomLog /var/www/staging/logs/access.log combined
    <Directory "/var/www/staging/public">
            Options +Indexes +FollowSymLinks
            AllowOverride All
            Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST2}" > /etc/apache2/sites-available/stage_env.conf
sudo a2ensite stage_env

VHOST3=$(cat <<EOF
<VirtualHost *:80>
    ServerName beta.site.dev
    ServerAlias www.beta.site.dev
    DocumentRoot "/var/www/beta/public"
    SetEnv APPLICATION_ENV "beta"
    SetEnv APPLICATION_NAME "beta_env"
    ServerAdmin dre.board@gmail.com
    ErrorLog /var/www/beta/logs/error.log
	CustomLog /var/www/beta/logs/access.log combined
    <Directory "/var/www/beta/public">
            Options +Indexes +FollowSymLinks
            AllowOverride All
            Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST3}" > /etc/apache2/sites-available/beta_env.conf
sudo a2ensite beta_env	
    #sudo cp /vagrant/dev_ops/apache/site.conf /etc/apache2/sites-available/000-default.conf
    #sudo cp /vagrant/dev_ops/apache/site.conf /etc/apache2/sites-available
    #sudo a2ensite site
    sudo service apache2 start
	
#-------Start/restart apache
echo "=====================Restarting apache"
sudo service apache2 restart
echo "----------Apache restarted"

