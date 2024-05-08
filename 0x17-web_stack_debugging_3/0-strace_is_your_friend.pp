# 0-strace_is_your_friend.pp
# This Puppet manifest fixes a common Apache 500 error by ensuring proper permissions
# and presence of a necessary configuration file.

# Ensure the Apache configuration file exists and has correct permissions
file { '/etc/apache2/apache2.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'www-data',
  mode    => '0644',
  require => Package['apache2'],
}

# Restart Apache to apply changes and fix the error
service { 'apache2':
  ensure     => running,
  enable     => true,
  subscribe  => File['/etc/apache2/apache2.conf'],
  require    => File['/etc/apache2/apache2.conf'],
}
