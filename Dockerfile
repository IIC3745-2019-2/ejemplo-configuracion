FROM ruby:2.6.3

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential software-properties-common

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

ENV APP_HOME /ejemplo-configuracion

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME
