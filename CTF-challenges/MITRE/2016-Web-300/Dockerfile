# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-ruby19:latest

# Set correct environment variables.
ENV HOME /root
ENV RAILS_ENV production
ENV DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y inotify-tools

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD rails-env.conf /etc/nginx/main.d/rails-env.conf
ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

ADD keyleak-watchpublic /usr/bin/keyleak-watchpublic
RUN chmod 755 /usr/bin/keyleak-watchpublic
RUN mkdir /etc/service/watchpublic
ADD watchpublic /etc/service/watchpublic/run
RUN chmod 755 /etc/service/watchpublic/run

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install
RUN mkdir /home/app/webapp
ADD . /home/app/webapp

RUN touch /home/app/webapp/tmp/cache/assets/HOLDPERMS

RUN chown -R app:app /home/app/webapp

VOLUME /home/app/webapp/tmp/cache/assets

RUN rm /etc/container_environment.sh

RUN rm -rf /home/app/webapp/public

WORKDIR /home/app/webapp

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80