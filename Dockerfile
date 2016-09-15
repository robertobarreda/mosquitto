FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -yq curl
RUN curl -s http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
RUN curl -s http://repo.mosquitto.org/debian/mosquitto-jessie.list | tee  /etc/apt/sources.list.d/mosquitto-jessie.list
RUN apt-get update
RUN apt-get install -yq mosquitto
RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
CMD ["/usr/sbin/mosquitto"]
