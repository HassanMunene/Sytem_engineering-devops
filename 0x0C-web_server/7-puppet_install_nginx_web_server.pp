package { 'nginx':
ensure => 'installed',
}

service { 'nginx':
ensure  => 'running',
enable  => true,
require => Package['nginx'],
}

file {'/etc/nginx/sites-available/default':
ensure  => 'file',
content => '
   server {
       listen 80;
       listen [::]:80 default_server;
       root /etc/nginx/html;
       index index.html index.htm;
   
        location / {
            return 200 "Hello World!";
        }
        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4
        }
    }
',
require => Package['nginx'],
notify  => Service['nginx']
}

