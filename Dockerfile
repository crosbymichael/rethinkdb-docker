# http://www.rethinkdb.com/
# version 2.2
FROM ubuntu:15.04

RUN echo "deb http://download.rethinkdb.com/apt trusty main" | tee /etc/apt/sources.list.d/rethinkdb.list 
ADD http://download.rethinkdb.com/apt/pubkey.gpg /pubkey.gpg

RUN apt-key add pubkey.gpg && apt-get update && \
    apt-get install -y rethinkdb && \
    mkdir /rethinkdb && chown -R daemon:daemon /rethinkdb 

WORKDIR /rethinkdb
ENTRYPOINT ["/usr/bin/rethinkdb"]
CMD ["--help"]
