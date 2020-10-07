FROM ruby:2.6.1

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client \
  gnupg

  RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
  RUN apt-get install -y nodejs

  RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
  RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
  RUN apt-get update
  RUN apt-get install -y yarn


WORKDIR /project
COPY Gemfile Gemfile.lock /project/

RUN bundle install

RUN rails webpacker:install
