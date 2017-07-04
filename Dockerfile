FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl

# TODO this install couch 1.6; we should install 1.6.1 or 2.x
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:couchdb/stable
RUN apt-get update
RUN apt-get install -y couchdb

RUN apt-get install -y npm
RUN npm install n -g
RUN n latest

RUN apt-get install -y less
RUN apt-get install -y vim

### REMEMBER TO ADD ALL APT-GET INSTALL TO END OF LIST ###

RUN npm install -g horticulturalist@0.1.8

RUN apt-get install -y nginx

RUN useradd nginx

ADD build/dist /alex-and-dave

CMD /alex-and-dave/docker-startup
