FROM docker-dbc.artifacts.dbccloud.dk/dbc-buster:latest
LABEL maintainer=meta-scrum@dbc.dk

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
