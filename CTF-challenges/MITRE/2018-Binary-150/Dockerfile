FROM ubuntu

ARG FLAG

RUN apt update -y && \
	apt install -y gcc socat pwgen

RUN useradd -m -s /bin/bash ctf

WORKDIR /home/ctf
COPY verify.c .
RUN gcc verify.c -o challenge
RUN echo "${FLAG}" > flag
RUN pwgen -ys 20 1 > key

USER ctf
EXPOSE 1337
CMD /usr/bin/socat TCP-LISTEN:1337,fork,reuseaddr system:/home/ctf/challenge,pty,echo=0
