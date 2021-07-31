#!/bin/bash

#updating repository
sudo yum update -y

# installing Apache
sudo yum -y install apache2

# installing MySQL and dependencies, also setting up root password
echo ">>> Installing MySQL 5.7"

tee -a /etc/yum.repos.d/mysql-57-community.repo << END

[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/\$basearch/
enabled=1
gpgcheck=0
END

yum -y -q update
yum -y -q install mysql-community-server
systemctl start mysqld.service

password=$(cat /var/log/mysqld.log | grep "A temporary password is generated for" | tail -1 | sed -n 's/.*root@localhost: //p')
newPassword="mySQL@123"
mysql --connect-expired-password -uroot -p$password -Bse "ALTER USER 'root'@'localhost' IDENTIFIED BY '$newPassword';"

systemctl restart mysqld.service
systemctl enable mysqld.service

# Installing apache
echo ">>> Installing Apache"

yum -y -q install httpd
systemctl restart httpd.service
systemctl enable httpd.service

# Installing PHP
echo">>> Installing PHP 7.1"
yum -y -q install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum -y -q install php71-php mod_php71w php71w-mysql php71w-devel php71-php-devel php71-php-pecl-xdebug php71-php-mbstring php71-php-pecl-mysql
systemctl restart httpd.service

# Installing composer
echo ">>> Installing Composer"

sudo curl -sS https://getcomposer.org/installer | php71
mv composer.phar /usr/local/bin/composer

# Installing PHP MyAdmin
echo "Installing PHP MyAdmin"
yum -y -q install wget unzip
wget -q -O ~/phpmyadmin.zip https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_5_4_1.zip
unzip -q ~/phpmyadmin.zip -d /var/www/html
mv /var/www/html/phpmyadmin-RELEASE_4_5_4_1 /var/www/html/phpmyadmin
rm ~/phpmyadmin.zip