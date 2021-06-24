#!/bin/sh
    sudo yum install -y httpd
    sudo systemctl enable httpd
    sudo systemctl start httpd
    sudo chown -R $USER:$USER /var/www/html
    sudo echo "<html><body><h1>Hola desde Web Server</h1></body>" > /var/www/html/index.html

    sudo yum install -y git
    sudo yum install -y php
    sudo yum install -y php-msql