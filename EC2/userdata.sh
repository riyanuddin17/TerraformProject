#!/bin/bash
sudo apt-get update
sudo apt-get -y install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "HelloWorld" | sudo tee /var/www/html/index.html
