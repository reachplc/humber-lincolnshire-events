#!/bin/sh
#
# Setup the vagrant environment

# Copy site .conf file accross
sudo cp /vagrant/config/environments/development.conf /etc/apache2/sites-available/humberevents.dev.conf
sudo rm -rf /var/www
sudo mkdir -p /var/www
sudo ln -fs /vagrant /var/www/humberevents.dev

# Enable new virtual host
sudo ln -fs /etc/apache2/sites-available/humberevents.dev.conf /etc/apache2/sites-enabled/humberevents.dev.conf

# Restart Apache
sudo service apache2 restart

# Setup database
mysql -u root -proot -e "create database if not exists wordpress"
#mysql -u root -proot wordpress < /vagrant/config/bootstrap.sql

# Install Composer Dependencies
php /usr/local/bin/composer.phar update --working-dir="/var/www/humberevents.dev" --no-interaction

# Node
npm -v
npm install -g grunt-cli
npm install -g bower
npm install --prefix /html/app/themes/humber-lincolnshire-events/