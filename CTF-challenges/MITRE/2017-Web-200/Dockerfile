FROM phusion/passenger-ruby23:latest

# Set correct environment variables.
ENV HOME /root

# Enable nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Create virtual host
ADD docker/vhost.conf /etc/nginx/sites-enabled/app.conf

RUN apt-get update \
             && apt-get install -y --no-install-recommends \
                    ca-certificates \
                    bzip2 \
                    libfontconfig libmagickwand-dev imagemagick \
             && apt-get clean \
             && rm -rf /var/lib/apt/lists/*

RUN set -x  \
                # Install official PhantomJS release
             && apt-get update \
             && apt-get install -y --no-install-recommends \
                    curl \
             && mkdir /tmp/phantomjs \
             && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
                    | tar -xj --strip-components=1 -C /tmp/phantomjs \
             && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
                # Install dumb-init (to handle PID 1 correctly).
                # https://github.com/Yelp/dumb-init
             && curl -Lo /tmp/dumb-init.deb https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb \
             && dpkg -i /tmp/dumb-init.deb \
                # Clean up
             && apt-get purge --auto-remove -y \
                    curl \
             && apt-get clean \
             && rm -rf /tmp/* /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app/{public,private,tmp}

COPY Server.rb /usr/src/app
COPY config.ru /usr/src/app
COPY myActions.rb /usr/src/app
COPY myFinders.rb /usr/src/app

COPY private /usr/src/app/private
COPY tmp /usr/src/app/tmp

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
