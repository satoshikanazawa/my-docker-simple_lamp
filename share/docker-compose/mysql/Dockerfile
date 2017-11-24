# Docker mysql
FROM mysql:5.7
MAINTAINER satoshi.kanazawa

RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -p /var/log/mysql
RUN touch /var/log/mysql/mysql-bin.log
RUN chown -R mysql:mysql /var/log/mysql
#ADD my-master.cnf /etc/mysql/conf.d

# edit prompt
RUN echo 'PS1="[\u@mysql \W]$ "' >> ~/.bashrc

EXPOSE 3306
CMD ["mysqld"]
