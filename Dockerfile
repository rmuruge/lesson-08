FROM ubuntu:18.04

MAINTAINER Rajkumar

RUN apt-get update && apt-get install -y apache2 && apt-get install -y curl wget && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

WORKDIR /var/www/html

COPY index.html /var/www/html
ADD ProjectHtml /var/www/html

EXPOSE 80

SHELL ["/bin/sh", "-c"]
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

