#!/bin/bash
# Install libs
sudo yum -y update 
sudo yum install -y httpd php git

# Get source code
sudo git clone https://github.com/Lee-GaIn/php-sample-code 
cd php-sample-code
cd Playlist
sudo mv * /var/www/html
sudo chown -R ec2-user:ec2-user /var/www/html

# Start web server
sudo systemctl start httpd
sudo systemctl enable httpd