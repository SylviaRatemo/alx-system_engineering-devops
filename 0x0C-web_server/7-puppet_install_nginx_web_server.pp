# puppet install nginx
exec {'/usr/bin/env apt-get -y update': }
exec {'/usr/bin/env apt-get -y install nginx': }
exec {'/usr/bin/env echo "301 Redirection" > /var/www/html/index.nginx-debian.html': }
exec {'/usr/bin/env sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.google.com permanent;" /etc/nginx/sites-available/default': }
exec {'/usr/bin/env service nginx start': }
