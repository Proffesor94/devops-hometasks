sudo apt update
sudo apt upgrade
<<<<<<< HEAD
sudo apt install -y apache2 

sudo apt -y install lsb-release apt-transport-https ca-certificates wget
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update
sudo apt -y install php7.4 #libapache2-mod-php7.4
=======
sudo apt install -y apache2 php
>>>>>>> 3f9c46823591cabc747d7c68b9e4385f65dafe38

php -v

echo 'Listen 81' >> /etc/apache2/ports.conf

#create dir siteone
mkdir -p /var/www/siteone/html
cp /home/vagrant/index/index.html /var/www/siteone/html
cp /home/vagrant/conf/siteone.conf /etc/apache2/sites-available/

#create dir sitetwo
mkdir -p /var/www/sitetwo/html
cp /home/vagrant/index/index.php /var/www/sitetwo/html
cp /home/vagrant/conf/sitetwo.conf /etc/apache2/sites-available/

#active siteone and sitetwo
sudo a2ensite siteone.conf
sudo a2ensite sitetwo.conf
sudo a2dissite 000-default.conf

#start php7.4
sudo a2enmod php7.*

echo 'Listen 81' >> /etc/apache2/ports.conf

#restart apache
systemctl restart apache2