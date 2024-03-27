# Ensure the stdlib module is included for the file_line resource
include stdlib

# Configure the SSH client to use a specific private key
file_line { 'Set SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[\s]*IdentityFile[\s]+',
  append_on_no_match => true,
  multiple           => true,
}

# Configure the SSH client to deny password authentication
file_line { 'Disable SSH Password Authentication':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[\s]*PasswordAuthentication[\s]+',
  append_on_no_match => true,
  multiple           => true,
}
