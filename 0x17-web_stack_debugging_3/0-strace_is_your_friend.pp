# 0-strace_is_your_friend.pp

# This comment describes the purpose of the Puppet manifest
# This manifest fixes permission errors on a specific file

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
