# Enable MySQL
sudo systemctl enable --now mysqld

# Expose port for php
echo 'Listen 81' | sudo tee -a /etc/httpd/conf/httpd.conf
echo 'ServerName 127.0.0.1' | sudo tee -a /etc/httpd/conf/httpd.conf

# Prepare files for static page
sudo mkdir -p /var/www/static_page
sudo cp /tmp/vagrant/index/index.html /var/www/static_page
sudo cp /tmp/vagrant/conf/static_page.conf /etc/httpd/conf.d/

# Prepare files for dynamic page
sudo mkdir -p /var/www/dynamic_page
sudo cp /tmp/vagrant/index/index.php /var/www/dynamic_page
sudo cp /tmp/vagrant/conf/dynamic_page.conf /etc/httpd/conf.d/

# Grant access to files for Apache
sudo chown -R apache.apache /var/www/
sudo systemctl stop firewalld

# Start Apache
sudo systemctl start httpd