# This Puppet manifest increases the ULIMIT for Nginx and restarts the Nginx server.

# Ensure the ULIMIT value is correctly set and uncommented in /etc/default/nginx
exec { 'fix-ulimit-for-nginx':
  command => 'sed -i "s/#ULIMIT=.*/ULIMIT=\\"-n 4096\\"/" /etc/default/nginx',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
  unless  => 'grep -q "^ULIMIT=\\"-n 4096\\"" /etc/default/nginx',
}

# Restart Nginx
exec { 'nginx-restart':
  command => 'service nginx restart',
  path    => ['/usr/local/bin', '/bin', '/usr/sbin', '/etc/init.d'],
  require => Exec['fix-ulimit-for-nginx'],
}
