# This Puppet manifest configures Nginx to handle higher load

exec { 'increase-nginx-worker-connections':
  command => '/usr/sbin/nginx -s reload',
  path    => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
}

file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  notify  => Exec['increase-nginx-worker-connections'],
}
