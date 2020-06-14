FROM ruby:2.5.3

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev ghostscript

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler -v 2.0.1
RUN gem install puma
ADD Gemfile* $APP_HOME/
RUN bundle install --jobs 20 --retry 5

ADD . $APP_HOME
RUN mkdir $APP_HOME/shared
RUN mkdir $APP_HOME/shared/log
RUN mkdir $APP_HOME/shared/pids
RUN mkdir $APP_HOME/shared/sockets
RUN chmod -R 777 $APP_HOME/shared
