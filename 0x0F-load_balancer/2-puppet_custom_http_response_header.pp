# set header
package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
      listen 80 default_server;
      server_name _;

      location / {
        proxy_set_header X-Served-By ${::hostname};
        # Other configuration directives...
      }
    }
  ",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  require => Package['nginx'],
}
