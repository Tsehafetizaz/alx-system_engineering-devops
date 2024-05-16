# This Puppet manifest increases the file limits for the holberton user to prevent "Too many open files" errors.

# Increase hard file limit for holberton user
exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard nofile/s/[0-9]*/50000/" /etc/security/limits.conf || echo "holberton hard nofile 50000" >> /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
  unless  => 'grep -q "holberton hard nofile 50000" /etc/security/limits.conf',
}

# Increase soft file limit for holberton user
exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft nofile/s/[0-9]*/50000/" /etc/security/limits.conf || echo "holberton soft nofile 50000" >> /etc/security/limits.conf',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
  unless  => 'grep -q "holberton soft nofile 50000" /etc/security/limits.conf',
}

# Ensure PAM module is configured to apply limits
exec { 'ensure-pam-limits':
  command => 'echo "session required pam_limits.so" >> /etc/pam.d/common-session',
  path    => ['/usr/local/bin', '/bin', '/usr/bin'],
  unless  => 'grep -q "session required pam_limits.so" /etc/pam.d/common-session',
  require => [Exec['increase-hard-file-limit-for-holberton-user'], Exec['increase-soft-file-limit-for-holberton-user']],
}
