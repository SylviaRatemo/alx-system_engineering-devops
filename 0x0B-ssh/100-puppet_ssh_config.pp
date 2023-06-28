#!/usr/bin/env bash
# Puppet to connect without password
file { '/etc/ssh/ssh_config':
  ensure  => file,
  content => "PasswordAuthentication no\nIdentityFile ~/.ssh/school\n",
}

service { 'ssh':
  ensure => running,
  enable => true,
}
