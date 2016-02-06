FROM ruby:2.2.4

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y yui-compressor --no-install-recommends  && rm -rf /var/lib/apt/lists/*



EXPOSE 3000

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app

CMD RAILS_ENV=production bundle exec rake db:create && bundle exec rake db:migrate && rails s -b 0.0.0.0