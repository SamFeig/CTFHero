FROM ubuntu:trusty
MAINTAINER Robert Clark <rbclark@mitre.org>

RUN apt-get update
RUN apt-get -y install openssh-server gcc gdb g++-multilib

WORKDIR /opt/challenge

COPY sshd_config /etc/ssh/sshd_config
COPY got.c .
COPY sensitive.txt .

RUN gcc -o GoT got.c -m32 -fno-stack-protector
RUN rm got.c /usr/bin/top /bin/ps
RUN chmod +x /opt/challenge/

RUN useradd chalowner
RUN chown chalowner:chalowner GoT
RUN chmod g+s GoT
RUN chown chalowner:chalowner sensitive.txt
RUN chmod 440 sensitive.txt

RUN useradd -ms /bin/bash  -d /opt/challenge challenge
RUN passwd -d challenge

RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]
