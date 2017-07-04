FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl

# TODO this install couch 1.6; we should install 1.6.1 or 2.x
RUN apt-get install -y couchdb

RUN apt-get install -y npm

RUN apt-get install -y less
RUN apt-get install -y vim

### REMEMBER TO ADD ALL APT-GET INSTALL TO END OF LIST ###

RUN npm install -g horticulturalist@0.1.4

ADD build/dist /alex-and-dave

CMD /alex-and-dave/docker-startup
