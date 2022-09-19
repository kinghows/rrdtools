# Nagios + rrdtools + iostat

yum install -y gcc gcc-c++ glibc glibc-common php gd gd-devel libpng libmng libjpeg zlib

yum install -y httpd php

yum install -y elinks 

yum install nagios -y

htpasswd /etc/nagios/passwd nagiosadmin

service httpd restart 

service nagios restart 

vim /etc/nagios/nagios.cfg

vim /etc/nagios/cgi.cfg

vim localhost.cfg

http://ip/nagios/

nagiosadmin/pwd
