# Puppet manifest to add a custom HTTP response header to Nginx
# This manifest configures Nginx on a new Ubuntu machine to include a custom HTTP header
# in its response, indicating the hostname of the server handling the request.
#
# Requirements:
# - Nginx should be installed
# - Custom HTTP header 'X-Served-By' should be added to responses

class nginx_custom_header {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    content => "user www-data;\nworker_processes auto;\npid /run/nginx.pid;\n\nevents {\n\tworker_connections 768;\n\t# multi_accept on;\n}\n\nhttp {\n\t...\n\tserver {\n\t\t...\n\t\tlocation / {\n\t\t\tadd_header X-Served-By $hostname;\n\t\t\t...\n\t\t}\n\t\t...\n\t}\n}",
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
