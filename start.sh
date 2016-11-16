#!/bin/bash

# Variaveis.
HOSTNAME="mariadbprod"
IMAGE="mariadb:latest"
DOCKER="/usr/bin/docker"
SSH="/etc/init.d/ssh"
BIND="/etc/init.d/mysql"

# Removendo o Container morto.
$DOCKER rm -f $(docker ps -aq --filter "name=$HOSTNAME") >> /dev/null 2>&1

# Iniciando o Container novo.
$DOCKER run --privileged \
--volume=/storage/mariadbprod/dados:/var/lib/mysql \
--volume=/docker-compose/banco_mariadb/my.cnf:/etc/mysql/my.cnf \
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
$DOCKER exec --privileged -it $id $BIND start
