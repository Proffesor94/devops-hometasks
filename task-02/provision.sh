sudo su

apt -y -q purge gnupg
apt install -y -q lxc lxc-templates curl gnupg2 dirmngr

systemctl enable lxc
systemctl start lxc

iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to-destination 10.0.3.11
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 81 -j DNAT --to-destination 10.0.3.12
iptables -L -t nat

echo 'kernel.unprivileged_userns_clone=1' >> /etc/sysctl.conf

cp /etc/default/grub /etc/default/grub.bak

cd /etc/default/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/conf-lxc/grub
update-grub

#config root
mkdir -p ~/.config/lxc/
cd ~/.config/lxc/
curl -O  https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/conf-lxc/root.conf

#vagrant veth lxcbr0
touch /etc/lxc/lxc-usernet
cd /etc/lxc
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/conf-lxc/lxc-usernet

#static ip
touch /etc/default/lxc-dhcp.conf
cd /etc/default/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/conf-lxc/lxc-dhcp.conf
systemctl restart lxc-net

#lxc_bridge
cd /etc/default/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/conf-lxc/lxc-net
systemctl restart lxc-net

lxc-create -n static_site -f /root/.config/lxc/root.conf --template download -- --dist centos --release 8-Stream --arch amd64 --keyserver hkp://keyserver.ubuntu.com
lxc-create -n dynamic_site -f /root/.config/lxc/root.conf --template download -- --dist centos --release 8-Stream --arch amd64 --keyserver hkp://keyserver.ubuntu.com

lxc-start -n static_site
lxc-start -n dynamic_site

sleep 10

#lxc-attach static_site -- yum update
lxc-attach static_site -- yum install -y -q httpd httpd-devel httpd-tools
lxc-attach static_site -- mkdir -p /var/www/siteone/html

cd /var/lib/lxc/static_site/rootfs/var/www/siteone/html/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/static_site/index.html

cd /var/lib/lxc/static_site/rootfs/etc/httpd/conf.d/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/static_site/siteone.conf

#lxc-attach static_site -- systemctl disable firewalld
#lxc-attach static_site -- service firewalld stop
#lxc-attach static_site -- setenforce 0
lxc-attach static_site -- systemctl restart httpd

lxc-attach dynamic_site -- yum install -y -q httpd httpd-devel httpd-tools php

echo 'Listen 81' >> /var/lib/lxc/dynamic_site/rootfs/etc/httpd/conf/httpd.conf
echo 'ServerName 127.0.0.1' >> /var/lib/lxc/dynamic_site/rootfs/etc/httpd/conf/httpd.conf

lxc-attach dynamic_site -- mkdir -p /var/www/sitetwo/html

cd /var/lib/lxc/dynamic_site/rootfs/var/www/sitetwo/html/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/dynamic_site/index.php

cd /var/lib/lxc/dynamic_site/rootfs/etc/httpd/conf.d/
curl -O https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-02/dynamic_site/sitetwo.conf

#lxc-attach dynamic_site -- systemctl disable firewalld
#lxc-attach dynamic_site -- service firewalld stop
lxc-attach dynamic_site -- setenforce 0
lxc-attach dynamic_site -- systemctl restart httpd
