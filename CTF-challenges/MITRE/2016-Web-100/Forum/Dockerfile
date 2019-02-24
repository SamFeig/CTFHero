FROM ruby:2.1-onbuild

ONBUILD RUN bundle install

COPY Forum.rb /usr/src/app

COPY public /usr/src/app

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV RACK_ENV production

CMD ["ruby", "Forum.rb"]