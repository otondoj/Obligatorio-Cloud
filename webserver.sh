#!/bin/sh
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo chown -R $USER:$USER /var/www/html
    ##sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y##
    sudo yum install -y yum-utils
    sudo yum install -y git
    sudo yum install -y php
    ##sudo yum-config-manager --enable remi-php56##
    sudo yum install -y mysql
    sudo yum install -y php-mysql
    sudo service httpd restart
    sudo sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/' /etc/httpd/conf/httpd.conf
    sudo git clone https://github.com/mauricioamendola/simple-ecomme.git/ /var/www/html/