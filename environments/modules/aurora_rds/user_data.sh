#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1
sudo amazon-linux-extras install php7.2
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable php-fpm
sudo systemctl start php-fpm
sudo chkconfig php-fpm on
sudo chkconfig nginx on
sudo sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sudo sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf
# Create the www dir
sudo mkdir /var/www/

# Permission for us to download wordpress
sudo chown ec2-user:ec2-user /var/www/
cd /var/www/
# Permission to nginx to use /var/www/
sudo chown -R nginx:nginx /var/www/

sudo mysql_install_db
sudo chown root:root nginx.conf
sudo chmod 644 nginx.conf
sudo mv nginx.conf /etc/nginx/

# The cherry on top
sudo service nginx restart
sudo service php-fpm restart
