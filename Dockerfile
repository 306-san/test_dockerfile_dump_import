FROM mongo:3.4.2
WORKDIR /tmp
ADD ./dump ./dump
RUN mongod --fork --dbpath /data/db/ --syslog && mongorestore --drop --db test --host localhost ./dump/test/ && mongod --shutdown

VOLUME ["/data/db"]
