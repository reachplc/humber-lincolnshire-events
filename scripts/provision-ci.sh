#!/bin/sh
#
# Setup the vagrant environment

# Setup PHP
echo "Setup PHP..."
phpenv local 5.5
# Install PHP dependancies
php -n /home/rof/bin/composer config -g github-oauth.github.com $GITHUB_ACCESS
php -n /home/rof/bin/composer install --no-interaction  --prefer-dist

# Setup NodeJS
echo "Setup NodeJS..."
nvm install 4.6
# Install dependancies for running your tests or other tasks
npm install -g grunt-cli

# Setup Ruby
echo "Setup Ruby..."
echo "@TODO: Remove and use NodeJS compiler"
gem install sass

# Clone Parent Theme
echo "Setup Parent Theme..."
git clone --branch "master" --depth 50 git@github.com:trinitymirror/humber-lincolnshire-events.git ~/clone/html/app/themes/humber-lincolnshire-events
npm install --prefix ./html/app/themes/humber-lincolnshire-events/

# Setup TM Events Theme
cd ~/clone/html/app/themes/humber-lincolnshire-events
grunt build
echo "Events Theme Built"
cd ~/clone/
