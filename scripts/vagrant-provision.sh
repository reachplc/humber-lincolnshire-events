#!/bin/sh
#
# Setup the vagrant environment

# Copy site .conf file accross
sudo cp /vagrant/config/environments/development.conf /etc/apache2/sites-available/humberevents.conf
sudo rm -rf /var/www
sudo mkdir -p /var/www
sudo ln -fs /vagrant /var/www/humberevents

# Enable new virtual host
sudo ln -fs /etc/apache2/sites-available/humberevents.conf /etc/apache2/sites-enabled/humberevents.conf

# Restart Apache
sudo service apache2 restart

# Setup database
mysql -u root -proot -e "create database if not exists wordpress"
#mysql -u root -proot wordpress < /vagrant/config/bootstrap.sql

# Install Composer Dependencies
php /usr/local/bin/composer.phar self-update
php /usr/local/bin/composer.phar config --global github-oauth.github.com 5ae6d07e5272929cfaa6a67b5569632a1d1c63f4
php /usr/local/bin/composer.phar update --working-dir="/var/www/humberevents" --no-interaction --prefer-dist

# Node
npm -v
npm install -g grunt-cli
npm install -g bower
npm install --prefix /html/app/themes/humber-lincolnshire-events/