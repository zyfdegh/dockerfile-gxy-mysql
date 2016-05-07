FROM mysql:5.6
MAINTAINER zyfdegg@gmail.com

ENV MYSQL_ROOT_PASSWORD 20160409nj
ENV MYSQL_USER secondhand 
ENV MYSQL_DATABASE secondhand
ENV MYSQL_PASSWORD zhushijie219211l

COPY my.cnf /etc/mysql/my.cnf

COPY mysql_dump.sql /
COPY restore-data.sh /

VOLUME ["/root/mysql-data","/var/lib/mysql"]

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]

# RUN /restore-data.sh
