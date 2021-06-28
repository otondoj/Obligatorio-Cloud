#!/bin/sh
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo chown -R $USER:$USER /var/www/html
    sudo yum install -y yum-utils
    sudo yum install -y git
    sudo yum install -y php
    sudo yum install -y mysql
    sudo yum install -y php-mysql
    sudo yum install mariadb-server
    sudo systemctl start mariadb
    sudo service httpd restart
    sudo yum -y install nfs-utils
    sudo mkdir ~/efs
    sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-c6871c72.efs.us-east-1.amazonaws.com:/ efs
    sudo sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/' /etc/httpd/conf/httpd.conf
    sudo git clone https://github.com/mauricioamendola/simple-ecomme.git/ /var/www/html/
    