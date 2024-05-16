# This Puppet manifest increases the file descriptor limit for the holberton user to prevent errors due to too many open files.

exec { 'increase-file-descriptor-limit':
  command => 'echo "* soft nofile 65536\n* hard nofile 65536\nholberton soft nofile 65536\nholberton hard nofile 65536" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep "holberton hard nofile 65536" /etc/security/limits.conf',
}

exec { 'increase-pam-limits':
  command => 'echo "session required pam_limits.so" >> /etc/pam.d/common-session',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep "session required pam_limits.so" /etc/pam.d/common-session',
  require => Exec['increase-file-descriptor-limit'],
}

exec { 'reload-ssh':
  command     => 'service ssh reload',
  path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  refreshonly => true,
  subscribe   => Exec['increase-pam-limits'],
}
