FROM ruby:2.1-onbuild

ONBUILD RUN bundle install

COPY Attacker.rb /usr/src/app

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV RACK_ENV production

CMD ["ruby", "Attacker.rb"]