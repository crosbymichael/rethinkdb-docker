# http://www.rethinkdb.com/
# version 1.12.5
FROM debian:jessie

ADD add-apt-repository /usr/sbin/add-apt-repository
RUN add-apt-repository ppa:rethinkdb/ppa && apt-get update && \
    apt-get install -y rethinkdb && \
    mkdir /rethinkdb && chown -R daemon:daemon /rethinkdb 

# process cluster webui
EXPOSE 28015 29015 8080

WORKDIR /rethinkdb
ENTRYPOINT ["/usr/bin/rethinkdb"]
CMD ["--help"]
