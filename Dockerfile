ARG RUBY_VERSION=3.0.0
FROM ruby:${RUBY_VERSION}

# Dependências
RUN apt-get update -q && apt-get install -y \
    apt-utils \
    build-essential \
    default-libmysqlclient-dev

WORKDIR /peeper/backend

RUN gem install bundler \
    bundle install && \    
    rails db:migrate && \
    rails db:seed && \
    git config --global init.defaultBranch main && \
    gem update --system && \

ARG RAILS_VERSION=7.0.7.2
RUN gem install rails -v=${RAILS_VERSION}
