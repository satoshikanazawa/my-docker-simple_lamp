# Docker 
FROM amazonlinux:2017.09
MAINTAINER satoshi.kanazawa

# Time Zone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# set yum repo
RUN echo "ap-northeast-1" > /etc/yum/vars/awsregion

RUN yum -y install ntp
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# set locale
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# require mw
RUN yum -y install gcc-c++ net-tools wget patch openssl-devel libyaml-devel zlib zlib-devel make bzip2 autoconf automake git vi which

# Apache
RUN yum -y install httpd24 httpd24-devel

# php
RUN yum -y install php70 php70-devel php70-mysql php70-pdo php70-mbstring

# composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer self-update
RUN composer global require hirak/prestissimo

# edit httpd.conf
RUN sed -i -e's/^#EnableMMAP \(off\|on\)/EnableMMAP off/' -e's/^#EnableSendfile \(off\|on\)/EnableSendfile off/' /etc/httpd/conf/httpd.conf

# start service
RUN chkconfig httpd on

# edit prompt
RUN echo 'PS1="[\u@httpd \W]$ "' >> ~/.bashrc

# start service
ADD startup.sh /etc/
RUN chmod 755 /etc/startup.sh
ENTRYPOINT ["/etc/startup.sh"]
