FROM ruby:2.4.1-alpine

ENV BUNDLE_PATH=/vendor/bundle \
  BUNDLE_JOBS=4

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apk add --no-cache --virtual .build-deps build-base \
  && apk add --no-cache  --virtual .run-deps mysql-dev \
  && bundle install \
  && apk del .build-deps

COPY . .
