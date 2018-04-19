# Container Docker MariaDB

- Construíndo a imagem mariadb:1.0.0
<pre>
# docker build -f build/Dockerfile -t mariadb:1.0.0 .
</pre>
- Criando o volume para o MariaDB (/var/lib/mysql)
<pre>
# docker volume create --name MariaDB
</pre>
- Iniciando o container
<pre>
# docker-compose up -d
</pre>
<hr>

