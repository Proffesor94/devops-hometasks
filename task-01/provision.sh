#!/bin/bash

# Update and install packages
sudo apt-get update && \
sudo apt-get install -y --no-install-recommends \
apache2 \
php && \
sudo apt-get autoremove -y && \
sudo apt-get clean && \
sudo rm -rf /var/lib/apt/lists/*

# Expose port for php
echo 'Listen 81' | sudo tee -a /etc/apache2/ports.conf

# Prepare files for static page
mkdir -p /var/www/static_page
cp /home/vagrant/index/index.html /var/www/static_page
cp /home/vagrant/conf/static_page.conf /etc/apache2/sites-available/

# Prepare files for dynamic page
mkdir -p /var/www/dynamic_page
cp /home/vagrant/index/index.php /var/www/dynamic_page
cp /home/vagrant/conf/dynamic_page.conf /etc/apache2/sites-available/

# Activate sites
sudo a2ensite static_page dynamic_page
sudo a2dissite 000-default.conf

# Enable PHP module
sudo a2enmod php7.*

# Restart apache
systemctl restart apache2