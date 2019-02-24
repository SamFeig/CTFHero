FROM phusion/baseimage
RUN apt-get update
RUN apt-get -y install build-essential ftp
RUN mkdir /usr/share/empty
RUN mkdir /var/ftp/
RUN useradd -d /var/ftp ftp
RUN chown root.root /var/ftp
RUN chmod og-w /var/ftp

COPY vsftpd-3.0.3 /home

RUN mkdir /usr/local/man/man5
RUN mkdir /usr/local/man/man8

RUN make -C /home/
RUN make install -C /home/
RUN cp /home/vsftpd.conf /etc/

ADD start_vsftpd /etc/service/vsftpd/run
RUN chmod 755 /etc/service/vsftpd/run

EXPOSE 21

CMD ["/sbin/my_init"]
