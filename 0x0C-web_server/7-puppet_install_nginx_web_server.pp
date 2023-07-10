#!/usr/bin/env bash
# Puppet manifest that installs and configures an Nginx server with a 301 redirect

package { 'nginx':
ensure => installed,
}
file_line { 'install':,
ensure => 'present',
path => '/etc/nginx/sites-enabled/default',
after => 'listen 80 default_server;',
line => 'rewrite ^ /redirect_me https://www.github.com/meseret1918 permanent;',
}
file {'/var/www/html/index.html':
content => 'Hello World!',
}
service {'nginx':
ensure => running,
required => package{'nginx'},
}
