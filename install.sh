#!/bin/bash
apt-get update
#apt-get -y install python-software-properties
apt-get -y install software-properties-common wget gnupg gnupg2
apt-get -y purge php php*
wget -O- "https://download.opensuse.org/repositories/home:/andykimpe:/ubuntu-$(lsb_release -sc)/xUbuntu_$(lsb_release -sr)/Release.key" | sudo apt-key add -
sudo rm -f /etc/apt/sources.list.d/*andykimpe*.list
echo 'deb http://download.opensuse.org/repositories/home:/andykimpe:/ubuntu-'$(lsb_release -sc)'/xUbuntu_'$(lsb_release -sr)'/ /' | sudo tee /etc/apt/sources.list.d/andykimpe.list
apt-get update
apt-get -y dist-upgrade
apt-get -y install apache2 apache2-bin apache2-data apache2-utils libapache2-mod-php5.6 php5.6 php5.6-common php5.6-cli php5.6-mysql php5.6-gd php5.6-mcrypt php5.6-curl php-pear php5.6-imap php5.6-xmlrpc php5.6-xsl php5.6-intl php php-dev php5.6-dev php5.6-mbstring
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
FILE1="/home/xtreamcodes/iptv_xtream_codes/wwwdir/index.php"
FILE2="/home/streamcreed/wwwdir/index.php"
if test -f "$FILE1" ;then
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/ports.conf -O /etc/apache2/ports.conf
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/000-default.conf -O /etc/apache2/sites-available/000-default.conf
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/default-ssl.conf -O /etc/apache2/sites-available/default-ssl.conf
    service apache2 restart
else if test -f "$FILE2" ;then
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/ports.conf -O /etc/apache2/ports.conf
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/000-default.conf -O /etc/apache2/sites-available/000-default.conf
    wget https://github.com/amidevous/ubuntu-apache-install/raw/master/default-ssl.conf -O /etc/apache2/sites-available/default-ssl.conf
    service apache2 restart
else
    service apache2 restart
fi
fi
