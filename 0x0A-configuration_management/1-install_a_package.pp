#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
# Puppet manifest to install flask package from pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
