FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl

# TODO this install couch 1.6; we should install 1.6.1 or 2.x
RUN apt-get install -y couchdb

RUN apt-get install -y npm

RUN npm install -g horticulturalist

ADD build/dist /alex-and-dave

CMD /alex-and-dave/docker-startup
