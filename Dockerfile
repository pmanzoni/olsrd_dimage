# Use an Alpine base image
FROM alpine:latest

COPY alpine_repositories /etc/apk/repositories

RUN apk update
RUN apk add olsrd

RUN apk add iptables
RUN apk add iperf

COPY olsrd.conf /etc/olsrd/olsrd.conf
ENTRYPOINT ["/usr/sbin/olsrd","-nofork"]
