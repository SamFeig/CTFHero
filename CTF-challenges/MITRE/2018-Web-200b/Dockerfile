FROM phusion/passenger-ruby24:latest

# Set correct environment variables.
ENV HOME /root

# Enable nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Create virtual host
ADD docker/vhost.conf /etc/nginx/sites-enabled/app.conf

RUN apt-get update && apt-get install -y tzdata

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN gem update --system

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install

COPY . .

ENV RACK_ENV production

RUN bundle exec rails db:create && bundle exec rails db:schema:load && bundle exec rails db:seed && bundle exec rails assets:precompile

RUN chown -R app:app /usr/src/app

# Clean up when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]