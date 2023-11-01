ARG RUBY_VERSION=3.0.0
FROM ruby:$RUBY_VERSION

# Dependências
RUN apt-get update -q && apt-get install -y \
    apt-utils \
    build-essential \
    default-libmysqlclient-dev

WORKDIR /peeper

COPY . /peeper/

RUN bundle install

RUN git config --global init.defaultBranch main

RUN gem update --system
RUN gem install bundler

ARG RAILS_VERSION=7.0.7.2
RUN gem install rails -v=$RAILS_VERSION
