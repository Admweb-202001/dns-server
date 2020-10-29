FROM ubuntu:18.04
MAINTAINER "Administraçao de Serviços Web"
RUN apt-get update && apt-get install -y bind9 dnsutils iputils.ping
EXPOSE 53
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
