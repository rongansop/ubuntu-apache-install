#!/bin/bash
VERSION=5.6
PORT=80
PORTSSL=443
read -e -p "Enter php mumber version 5.6 or 7.0 or 7.1 or 7.3 or 7.4 or 8.0: " -i "$VERSION" VERSION
read -e -p "Enter apache http port: " -i "$PORT" PORT
read -e -p "Enter apache https port: " -i "$PORTSSL" PORTSSL
apt-get update
apt-get -y install python-software-properties
apt-get -y install software-properties-common wget gnupg gnupg2
#apt-get -y purge php php*
add-apt-repository -y -s ppa:andykimpe/curl
add-apt-repository -y -s  ppa:ondrej/apache2
add-apt-repository -y -s  ppa:ondrej/php
apt-get update
apt-get -y dist-upgrade
apt-get -y install apache2 apache2-bin apache2-data apache2-utils php php-dev php-pear
apt-get -y install libapache2-mod-php5.6 php5.6 php5.6-common php5.6-cli php5.6-mysql php5.6-gd php5.6-mcrypt php5.6-curl php5.6-imap php5.6-xmlrpc php5.6-xsl php5.6-intl php5.6-dev php5.6-mbstring
apt-get -y install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-cli php7.0-mysql php7.0-gd php7.0-mcrypt php7.0-curl php7.0-imap php7.0-xmlrpc php7.0-xsl php7.0-intl php7.0-dev php7.0-mbstring
apt-get -y install libapache2-mod-php7.1 php7.1 php7.1-common php7.1-cli php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-curl php7.1-imap php7.1-xmlrpc php7.1-xsl php7.1-intl php5.6-dev php5.6-mbstring
apt-get -y install libapache2-mod-php7.1 php7.1 php7.1-common php7.1-cli php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-curl php7.1-imap php7.1-xmlrpc php7.1-xsl php7.1-intl php7.1-dev php7.1-mbstring
apt-get -y install libapache2-mod-php7.2 php7.2 php7.2-common php7.2-cli php7.2-mysql php7.2-gd php7.2-mcrypt php7.2-curl php7.2-imap php7.2-xmlrpc php7.2-xsl php7.2-intl php7.2-dev php7.2-mbstring
apt-get -y install libapache2-mod-php7.3 php7.3 php7.3-common php7.3-cli php7.3-mysql php7.3-gd php7.3-mcrypt php7.3-curl php7.3-imap php7.3-xmlrpc php7.3-xsl php7.3-intl php7.3-dev php7.3-mbstring
apt-get -y install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-cli php7.4-mysql php7.4-gd php7.4-mcrypt php7.4-curl php7.4-imap php7.4-xmlrpc php7.4-xsl php7.4-intl php7.4-dev php7.4-mbstring
apt-get -y install libapache2-mod-php8.0 php8.0 php8.0-common php8.0-cli php8.0-mysql php8.0-gd php8.0-mcrypt php8.0-curl php8.0-imap php8.0-xmlrpc php8.0-xsl php8.0-intl php8.0-dev php8.0-mbstring
update-alternatives --set php /usr/bin/php$VERSION
update-alternatives --set phar /usr/bin/phar$VERSION
update-alternatives --set phar.phar /usr/bin/phar.phar$VERSION
update-alternatives --set phpize /usr/bin/phpize$VERSION
update-alternatives --set php-config /usr/bin/php-config$VERSION
a2dismod php7.0
a2dismod php7.1
a2dismod php7.2
a2dismod php7.3
a2dismod php7.4
a2dismod php8.0
a2dismod php5.6
a2enmod php$VERSION
phpenmod -v $VERSION mcrypt
phpenmod -v $VERSION mbstring
a2enmod rewrite
wget https://raw.githubusercontent.com/andykimpe/ubuntu-apache-install/master/apache2.conf -O /etc/apache2/apache2.conf
sed -i "s/80/$PORT/g" "/etc/apache2/ports.conf"
sed -i "s/443/$PORTSSL/g" "/etc/apache2/ports.conf"
sed -i "s/80/$PORTSSL/g" "/etc/apache2/sites-available/000-default.conf"
sed -i "s/443/$PORTSSL/g" "/etc/apache2/sites-available/default-ssl.conf"
FILE1="/home/xtreamcodes/iptv_xtream_codes/wwwdir/index.php"
FILE2="/home/streamcreed/wwwdir/index.php"
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/5.6/php.ini -O /etc/php/5.6/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.0/php.ini -O /etc/php/7.0/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.1/php.ini -O /etc/php/7.1/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.2/php.ini -O /etc/php/7.2/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.3/php.ini -O /etc/php/7.3/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.4/php.ini -O /etc/php/7.4/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/8.0/php.ini -O /etc/php/8.0/apache2/php.ini
service apache2 restart
