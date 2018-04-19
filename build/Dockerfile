# imagem default
FROM ubuntu:16.04

# Responsavel
MAINTAINER Evandro Couto "vandocouto@gmail.com"

# update e instalação de pacotes
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y apt-utils wget telnet mytop vim passwd ifstat unzip mariadb-server mariadb-client -y && \
    rm -rf /var/lib/apt/lists/*

# habilitando a porta default do mariadb
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
    mkdir -p /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld

# Exportando LANG=C
RUN echo 'export LANG=C' >> /etc/profile

# Copiando o my.cnf default
COPY my.cnf /etc/mysql/
COPY run.sh /run.sh

# localtime
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# expose e cmd
EXPOSE 3106
ENTRYPOINT ["./run.sh"]
##ENTRYPOINT ["/usr/sbin/sshd" , "/usr/bin/mysqld_safe"]
#ENTRYPOINT ["/usr/bin/mysqld_safe"]

