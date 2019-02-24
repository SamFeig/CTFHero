FROM phusion/passenger-ruby23:latest

# Set correct environment variables.
ENV HOME /root

# Enable nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Create virtual host
ADD docker/vhost.conf /etc/nginx/sites-enabled/app.conf

RUN mkdir -p /usr/src/app

COPY Server.rb /usr/src/app
COPY config.ru /usr/src/app
RUN mkdir /usr/src/app/public
COPY public /usr/src/app/public

WORKDIR /usr/src/app

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install

RUN chown -R app:app /usr/src/app

# Clean up when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RACK_ENV production

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]