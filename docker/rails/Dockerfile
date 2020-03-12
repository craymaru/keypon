FROM ruby:2.6.5

ENV DEBCONF_NOWARNINGS yes

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  imagemagick \
  nodejs \
  yarn \
  vim \
  default-mysql-client &&\
  apt-get clean &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
  truncate -s 0 /var/log/*log

ENV LANG=C.UTF-8\
  GEM_HOME=/bundle\
  BUNDLE_JOBS=4\
  BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH\
  BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install --check-files

RUN gem install bundler
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j4


COPY . /app
RUN yarn install --check-files
RUN rails webpacker:install
RUN rails action_text:install
RUN bundle install -j4

RUN cp /app/docker/rails/database.yml /app/config/database.yml
# RUN cp /app/docker/rails/bootstrap-tagsinput.js /app/node_modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.js


# FOR PRODUCTION ENV
# RUN rails assets:precompile

EXPOSE 3000

