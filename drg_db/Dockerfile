FROM mysql
COPY drg_db.sql /docker-entrypoint-initdb.d/

ENV MYSQL_DATABASE drg_db
ENV MYSQL_ROOT_PASSWORD 123456

EXPOSE 3306
