# set header
exec { 'apt-get-update':
  command => '/usr/bin/apt-get -y update',
}

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.html':
  content => 'custom HTTP Header with Puppet',
}

augeas { 'add header':
  context => '/files/etc/nginx/sites-available/default',
  changes => [
    "set server[.='server_name _;']/add_header X-Served-By ${hostname}",
  ],
  require => Package['nginx'],
}

service { 'nginx':
  ensure => running,
}
