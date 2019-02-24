FROM ubuntu:trusty
MAINTAINER Robert Clark <rbclark@mitre.org>

RUN apt-get update
RUN apt-get -y install openssh-server gcc gdb g++-multilib

WORKDIR /opt/challenge

COPY sshd_config /etc/ssh/sshd_config
COPY farm .
COPY farm.c .
COPY flag .
COPY make.sh .
COPY flag .
COPY util.c .
COPY util.h .

RUN gcc -m32 -z execstack -fno-stack-protector -std=c99 -w farm.c util.c -o farm
RUN rm farm.c util.* 

RUN useradd chalowner
RUN chown chalowner:chalowner farm
RUN chmod g+s farm
RUN chmod +x farm

RUN useradd -ms /opt/challenge/farm  -d /opt/challenge challenge
RUN passwd -d challenge

RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]
