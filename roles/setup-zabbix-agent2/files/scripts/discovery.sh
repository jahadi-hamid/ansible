#!/bin/bash

discover=$(uname -vsn)

if [ $(pgrep  "nginx|www-data" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "nginx" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" nginx "; fi
if [ $(pgrep  "mysql|mariadb" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "mysql|mariadb" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" mysql "; fi
if [ $(pgrep  "php-fpm" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "php-fpm" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" php-fpm "; fi
if [ $(pgrep  "postgres" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "php-fpm" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" postgres "; fi
if [ $(pgrep  "httpd|apache" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "httpd|apache" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" apache "; fi
if [ $(pgrep  "nfs-server" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "nfs-server" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" nfsserver "; fi
if [ $(pgrep  "redis" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "redis" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" redis "; fi
if [ $(pgrep -u "rabbitmq" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "rabbitmq" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" rabbitmq "; fi
if [ $(pgrep  "haproxy" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "haproxy" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" haproxy "; fi
if [ $(pgrep -u "elastic" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "elastic" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" elasticsearch "; fi
if [ $(pgrep -f "kubelet" 2>/dev/null |wc -l) -gt 0 ] && [ $(systemctl| egrep  "kubelet" 2>/dev/null |wc -l) -gt 0 ]; then discover=$discover" kuber "; fi

discover=$discover" "`date +%Y-%m-%d`
echo $discover