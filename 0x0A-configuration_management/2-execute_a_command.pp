# manifest file
exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/usr/bin/env',
  refreshonly => true,
}
