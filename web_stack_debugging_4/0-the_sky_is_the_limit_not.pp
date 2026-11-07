# Raises the open files limit so Nginx can handle many concurrent requests
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
} ->

# Restarts Nginx so the new limit takes effect
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/',
}
