# imagem default
FROM ubuntu:16.04

# Responsavel
MAINTAINER Evandro Couto "vandocouto@gmail.com"

# update e instalação de pacotes
RUN apt-get update -y ; apt-get upgrade -y && \
    apt-get install apt-utils wget openssh-server telnet mytop -y && \
    apt-get install vim passwd ifstat unzip mariadb-server mariadb-client -y && \
    rm -rf /var/lib/apt/lists/*

# habilitando a porta default do mariadb
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf

# ajustando o SSH
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -y && \
    sed -ri 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config && \
    sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
    echo 'root:root' | chpasswd

# Criando o diretório do pid ssh
RUN mkdir -p /var/run/sshd && \
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
EXPOSE 22
EXPOSE 3106
ENTRYPOINT ["./run.sh"]
##ENTRYPOINT ["/usr/sbin/sshd" , "/usr/bin/mysqld_safe"]
#ENTRYPOINT ["/usr/bin/mysqld_safe"]

