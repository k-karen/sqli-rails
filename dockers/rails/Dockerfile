FROM ruby:3.2.2-bookworm

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY . /app
