FROM frodenas/couchdb

ADD dist/ /alex-and-dave

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

RUN npm install -g horticulturalist
