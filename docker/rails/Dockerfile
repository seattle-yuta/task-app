FROM ruby:2.5

ENV LANG C.UTF-8

# base
RUN apt-get update -qq && apt-get install -y sudo build-essential libpq-dev vim mysql-client

# yarn
RUN apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install -y yarn

# node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install nodejs

# node-sass
RUN yarn add node-sass

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN bundle install
