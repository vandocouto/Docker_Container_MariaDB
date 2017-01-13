#!/bin/bash

# Variaveis.
HOSTNAME="mariad"
IMAGE="mariadb:1.0.0"
DOCKER="/usr/bin/docker"
SSH="/etc/init.d/ssh"
MYSQL="/etc/init.d/mysql"

# Removendo o Container morto.
$DOCKER rm -f $(docker ps -aq --filter "name=$HOSTNAME") >> /dev/null 2>&1

# Iniciando o Container novo.
$DOCKER run --privileged \
--volume=MariaDB:/var/lib/mysql \
--volume=`pwd`/my.cnf:/etc/mysql/my.cnf \
--publish=127.0.0.1:2200:22 \
--publish=3306:3306 \
--restart=always \
-itd --name=$HOSTNAME \
$IMAGE /bin/bash

# Recebendo o ID do novo container.
id=$($DOCKER ps -q --filter "name=$HOSTNAME")
echo $id

# Iniciando o SSH
$DOCKER exec -it $id $SSH start
# Iniciando o Mysql
$DOCKER exec --privileged -it $id /usr/bin/mysqld_safe -D
