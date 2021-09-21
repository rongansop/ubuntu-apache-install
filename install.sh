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
apt-get -y install apache2 libapache2-mod-fcgid apache2-bin apache2-data apache2-utils php-pear
apt-get -y install libapache2-mod-php php php-common php-fpm php-cli php-mysql php-gd php-mcrypt php-curl php-imap php-xmlrpc php-intl php-dev php-mbstring
apt-get -y install libapache2-mod-php5.6 php5.6 php5.6-common php5.6-fpm php5.6-cli php5.6-mysql php5.6-gd php5.6-mcrypt php5.6-curl php5.6-imap php5.6-xmlrpc php5.6-xsl php5.6-intl php5.6-dev php5.6-mbstring
apt-get -y install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-fpm php7.0-cli php7.0-mysql php7.0-gd php7.0-mcrypt php7.0-curl php7.0-imap php7.0-xmlrpc php7.0-xsl php7.0-intl php7.0-dev php7.0-mbstring
apt-get -y install libapache2-mod-php7.1 php7.1 php7.1-common php7.1-fpm php7.1-cli php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-curl php7.1-imap php7.1-xmlrpc php7.1-xsl php7.1-intl php7.1-dev php7.1-mbstring
apt-get -y install libapache2-mod-php7.2 php7.2 php7.2-common php7.2-fpm php7.2-cli php7.2-mysql php7.2-gd php7.2-mcrypt php7.2-curl php7.2-imap php7.2-xmlrpc php7.2-xsl php7.2-intl php7.2-dev php7.2-mbstring
apt-get -y install libapache2-mod-php7.3 php7.3 php7.3-common php7.3-fpm php7.3-cli php7.3-mysql php7.3-gd php7.3-mcrypt php7.3-curl php7.3-imap php7.3-xmlrpc php7.3-xsl php7.3-intl php7.3-dev php7.3-mbstring
apt-get -y install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-fpm php7.4-cli php7.4-mysql php7.4-gd php7.4-mcrypt php7.4-curl php7.4-imap php7.4-xmlrpc php7.4-xsl php7.4-intl php7.4-dev php7.4-mbstring
apt-get -y install libapache2-mod-php8.0 php8.0 php8.0-common php8.0-fpm php8.0-cli php8.0-mysql php8.0-gd php8.0-mcrypt php8.0-curl php8.0-imap php8.0-xmlrpc php8.0-xsl php8.0-intl php8.0-dev php8.0-mbstring
update-alternatives --set php /usr/bin/php$VERSION
update-alternatives --set phar /usr/bin/phar$VERSION
update-alternatives --set phar.phar /usr/bin/phar.phar$VERSION
update-alternatives --set phpize /usr/bin/phpize$VERSION
update-alternatives --set php-config /usr/bin/php-config$VERSION
update-alternatives --remove-all php-fpm
rm -f /usr/sbin/php-fpm
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm5.6 70
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm7.0 60
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm7.1 50
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm7.2 40
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm7.3 30
update-alternatives --install /usr/sbin/php-fpm php-fpm /usr/sbin/php-fpm8.0 20
update-alternatives --set php-fpm /usr/sbin/php-fpm$VERSION
a2dismod php7.0
a2dismod php7.1
a2dismod php7.2
a2dismod php7.3
a2dismod php7.4
a2dismod php8.0
a2dismod php5.6
#a2enmod php$VERSION
phpenmod -v 5.6 mcrypt
phpenmod -v 5.6 mbstring
phpenmod -v 7.0 mcrypt
phpenmod -v 7.1 mbstring
phpenmod -v $VERSION mcrypt
phpenmod -v $VERSION mbstring
phpenmod -v $VERSION mcrypt
phpenmod -v $VERSION mbstring
phpenmod -v $VERSION mcrypt
phpenmod -v $VERSION mbstring
phpenmod -v $VERSION mcrypt
phpenmod -v $VERSION mbstring
a2enmod rewrite
a2dismod mpm_prefork
a2enmod mpm_event
a2enmod proxy_fcgi
a2enmod proxy
a2disconf php5.6-fpm
a2disconf php7.0-fpm
a2disconf php7.1-fpm
a2disconf php7.2-fpm
a2disconf php7.3-fpm
a2disconf php7.4-fpm
a2disconf php8.0-fpm
a2disconf php5.6-fpm
a2enconf php$VERSION-fpm
systemctl stop php5.6-fpm
systemctl disable php5.6-fpm
systemctl stop php7.0-fpm
systemctl disable php7.0-fpm
systemctl stop php7.1-fpm
systemctl disable php7.1-fpm
systemctl stop php7.2-fpm
systemctl disable php7.2-fpm
systemctl stop php7.3-fpm
systemctl disable php7.3-fpm
systemctl stop php7.4-fpm
systemctl disable php7.4-fpm
systemctl stop php8.0-fpm
systemctl disable php8.0-fpm
systemctl start php$VERSION-fpm
systemctl enable php$VERSION-fpm
wget https://raw.githubusercontent.com/andykimpe/ubuntu-apache-install/master/apache2.conf -O /etc/apache2/apache2.conf
sed -i "s/80/$PORT/g" "/etc/apache2/ports.conf"
sed -i "s/443/$PORTSSL/g" "/etc/apache2/ports.conf"
sed -i "s/80/$PORT/g" "/etc/apache2/sites-available/000-default.conf"
sed -i "s/443/$PORTSSL/g" "/etc/apache2/sites-available/default-ssl.conf"
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local && rm-f ioncube_loaders_lin_x86-64.tar.gz
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/5.6/php.ini -O /etc/php/5.6/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/5.6/php.ini -O /etc/php/5.6/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/5.6/php.ini -O /etc/php/5.6/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.0/php.ini -O /etc/php/7.0/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.0/php.ini -O /etc/php/7.0/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.0/php.ini -O /etc/php/7.0/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.1/php.ini -O /etc/php/7.1/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.1/php.ini -O /etc/php/7.1/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.1/php.ini -O /etc/php/7.1/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.2/php.ini -O /etc/php/7.2/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.2/php.ini -O /etc/php/7.2/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.2/php.ini -O /etc/php/7.2/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.3/php.ini -O /etc/php/7.3/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.3/php.ini -O /etc/php/7.3/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.3/php.ini -O /etc/php/7.3/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.4/php.ini -O /etc/php/7.4/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.4/php.ini -O /etc/php/7.4/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/7.4/php.ini -O /etc/php/7.4/fpm/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/8.0/php.ini -O /etc/php/8.0/apache2/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/8.0/php.ini -O /etc/php/8.0/cli/php.ini
wget https://raw.githubusercontent.com/amidevous/ubuntu-apache-install/master/8.0/php.ini -O /etc/php/8.0/fpm/php.ini
systemctl restart apache2
