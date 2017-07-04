FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y couchdb npm

RUN npm install -g horticulturalist

ADD build/dist /alex-and-dave
