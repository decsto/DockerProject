# Version 3.0

FROM debian:stretch
#install npm ,node.js, noble, mqtt 
USER root
WORKDIR /iot
RUN apt-get -y update
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install bluetooth bluez libbluetooth-dev libudev-dev -y
RUN apt-get install usbutils -y
RUN apt-get -y install nodejs
RUN npm install -v
RUN npm init -y
RUN npm install @abandonware/noble --unsafe-perm -y
RUN npm install mqtt -y
RUN apt-get install mariadb-server -y
RUN apt-get install wget
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update
RUN apt-get install mongodb-org -y
RUN mkdir -p /data/db/
RUN npm install mongodb --save
RUN npm install mariadb -y



