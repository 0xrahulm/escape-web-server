FROM jruby:9.0.5.0
# UK mirror for more speedyness
RUN perl -pi -e 's/http.debian.net/ftp.uk.debian.org/' /etc/apt/sources.list
 
RUN apt-get update -qq
RUN apt-get install -qq -y build-essential libpq-dev git mysql-client vim curl

RUN mkdir /rubygems
WORKDIR /rubygems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN jruby -S bundle install

RUN mkdir /escapeApp
WORKDIR /escapeApp

ADD . /escapeApp
RUN rails g rspec:install