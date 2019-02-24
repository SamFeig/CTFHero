FROM ubuntu:xenial
MAINTAINER Frank Magazu

RUN apt-get update

RUN apt-get -y install openssh-server python

COPY TrafficDot.py /opt/challenge/TrafficDot.py
COPY sshd_config /etc/ssh/sshd_config


RUN chmod +x /opt/challenge/TrafficDot.py
RUN useradd -ms /opt/challenge/TrafficDot.py challenge
RUN passwd -d challenge
RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]