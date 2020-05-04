#!/bin/bash
apt-get update
apt-get -y dist-upgrade
#apt-get -y install python-software-properties
apt-get -y install software-properties-common
add-apt-repository -y ppa:ondrej/apache2
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get -y install libapache2-mod-php5.6 php5.6-common php5.6-cli php5.6-mysql php5.6-gd php5.6-mcrypt php5.6-curl php-pear php5.6-imap php5.6-xmlrpc php5.6-xsl php5.6-intl php php-dev php5.6-dev php5.6-mbstring
update-alternatives --set php /usr/bin/php5.6
update-alternatives --set phar /usr/bin/phar5.6
update-alternatives --set phar.phar /usr/bin/phar.phar5.6
update-alternatives --set phpize /usr/bin/phpize5.6
update-alternatives --set php-config /usr/bin/php-config5.6
a2dismod php7.0
a2dismod php7.1
a2dismod php7.2
a2dismod php7.3
a2dismod php7.4
a2enmod php5.6
phpenmod -v 5.6 mcrypt
phpenmod -v 5.6 mbstring
a2enmod rewrite
wget https://raw.githubusercontent.com/andykimpe/ubuntu-apache-install/master/apache2.conf -O /etc/apache2/apache2.conf
service apache2 restart
