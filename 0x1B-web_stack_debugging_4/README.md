# Web Stack Debugging #4

This project contains Puppet manifests for debugging and optimizing web stack configurations, specifically for Nginx servers and user limits.

## Task 0: Sky is the limit, let's bring that limit higher

This task involves optimizing an Nginx server to handle high load efficiently. The provided Puppet manifest configures Nginx to utilize all available CPU cores and increases the worker connections.

- **File:** `0-the_sky_is_the_limit_not.pp`
- **Template:** `nginx/nginx.conf.erb`

## Task 1: User limit

This task addresses the issue of too many open files for the `holberton` user by increasing the file descriptor limits.

- **File:** `1-user_limit.pp`

## Requirements

- All files must end with a new line.
- The Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors.
- The Puppet manifests must run without error.
- Each Puppet manifest's first line must be a comment explaining what the manifest is about.
- The Puppet manifests files must end with the extension `.pp`.
- Files will be checked with Puppet v3.4.

## Installation

To install `puppet-lint` version 2.1.1:

```bash
apt-get install -y ruby
gem install puppet-lint -v 2.1.1
