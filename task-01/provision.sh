#sudo dnf upgrade --refresh -y 
#sudo dnf install -y httpd @mysql php 
#sudo dnf clean all

sudo systemctl enable mysqld.service
sudo systemctl start mysqld.service

sudo echo 'Listen 81' >> /etc/httpd/conf/httpd.conf
echo 'ServerName 127.0.0.1' >> /etc/httpd/conf/httpd.conf
sudo systemctl enable httpd
sudo systemctl start httpd

#create dir siteone
sudo mkdir -p /var/www/html/siteone
sudo cp /tmp/vagrant/index/index.html /var/www/html/siteone
sudo cp /tmp/vagrant/conf/siteone.conf /etc/httpd/conf.d/

#create dir sitetwo
sudo mkdir -p /var/www/html/sitetwo
sudo cp /tmp/vagrant/index/index.php /var/www/html/sitetwo
sudo cp /tmp/vagrant/conf/sitetwo.conf /etc/httpd/conf.d/

sudo chown -R apache.apache /var/www/
sudo service firewalld stop

#restart apache
sudo systemctl restart httpd