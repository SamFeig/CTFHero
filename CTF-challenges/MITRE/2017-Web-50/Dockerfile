FROM eboraas/apache

ONBUILD RUN bundle install

COPY index.html /var/www/html/

WORKDIR /var/www/html/

ENV RACK_ENV production
