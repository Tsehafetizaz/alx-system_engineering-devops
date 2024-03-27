# install_nginx_web_server.pp

class nginx_setup {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    require   => Package['nginx'],
    subscribe => File['/etc/nginx/sites-available/default'],
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/usr/share/nginx/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/usr/share/nginx/html/404.html':
    ensure  => file,
    content => 'Ceci n\'est pas une page',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

include nginx_setup

# Template content for nginx.conf.erb
# Note: You need to create a nginx.conf.erb template file with the following content
# and place it in your module's templates directory.

# nginx.conf.erb
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /usr/share/nginx/html;
    index index.html;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }

    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}
