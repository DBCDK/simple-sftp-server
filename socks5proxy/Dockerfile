FROM docker.dbc.dk/dbc-buster:latest
MAINTAINER jbr@dbc.dk
ENV USERNAME=socksproxy
ENV PASSWORD=socksproxy

RUN apt update && \
    apt install dante-server -y

ADD etc /etc

ENV CFGFILE=/etc/conf/sockd.conf
ENV PIDFILE=/run/sockd.pid
ENV WORKERS=10

EXPOSE 1080

CMD /etc/dante.sh
