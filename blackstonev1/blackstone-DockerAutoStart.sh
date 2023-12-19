#!/bin/bash
#Image
docker-compose up -d
#External ip, web connect mysql
hostip=$(ip a s enp0s3 2>/dev/null | grep -o -P '[0-9]{1,3}(\.[0-9]{1,3}){3}' | head -n 1)
#Container ID
ID=$(docker ps | grep blackstone | cut -d " " -f1)
#Execute change ip in web config
docker exec $ID sed -i s/localhost/$hostip/ /var/www/html/conexion.php
