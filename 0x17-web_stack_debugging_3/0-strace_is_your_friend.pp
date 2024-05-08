# 0-strace_is_your_friend.pp

# This comment describes the purpose of the Puppet manifest
# This manifest fixes permission errors on a specific file

file { '/var/www/html/error.log':
  ensure => present,
  owner  => 'www-data',
  group  => 'www-data',
  mode   => '0644',
}
