FROM phusion/baseimage:0.9.19
MAINTAINER Valerio Santinelli <santinelli@altralogica.it>

CMD ["/sbin/my_init"]

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/testing multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update && apt-get install -y mongodb-org
RUN mkdir -p /data/db

EXPOSE 27017

RUN mkdir /etc/service/mongod
ADD mongod.sh /etc/service/mongod/run
RUN chmod +x /etc/service/mongod/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*