FROM mitrectf/ubuntu-sshd:latest

ARG FLAG

RUN groupadd chalowner

RUN echo ${FLAG} > /home/ctf/flag.txt

COPY dist/cwe-191-kitchen-release /home/ctf/cwe-191

RUN chmod 440 /home/ctf/flag.txt

RUN chown :chalowner /home/ctf/flag.txt

RUN chown :chalowner /home/ctf/cwe-191

RUN chmod g+s /home/ctf/cwe-191

RUN chsh -s /home/ctf/cwe-191 ctf