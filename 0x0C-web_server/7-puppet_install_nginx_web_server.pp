#!/usr/bin/env bash
# Puppet manifest that installs and configures an Nginx server with a 301 redirect

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/meseret1918 permanent;/" /etc/nginx/sites-enabled/default ; sudo service nginx start',
}
