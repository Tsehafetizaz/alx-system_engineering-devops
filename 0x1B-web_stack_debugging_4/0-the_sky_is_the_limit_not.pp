# This Puppet manifest optimizes the Nginx server configuration to handle more requests without failing.

exec { 'fix-nginx-configuration':
  command => '/usr/sbin/nginx -s reload',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'grep "worker_processes 1;" /etc/nginx/nginx.conf',
}

file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  notify  => Exec['fix-nginx-configuration'],
}
