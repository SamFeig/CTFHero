FROM python:2.7
MAINTAINER Fank Magazu? fmagazu@mitre.org

RUN apt-get update

RUN apt-get -y install openssh-server

COPY flag /opt/challenge/flag
COPY pyescape.py /opt/challenge/pyescape.py
COPY sshd_config /etc/ssh/sshd_config

RUN chmod +x /opt/challenge/pyescape.py
RUN useradd -ms /opt/challenge/pyescape.py -d /opt/challenge challenge
RUN passwd -d challenge
RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
