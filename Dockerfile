FROM ruby:2.4.1-alpine

ARG LOCAL_BUILD=

ENV BUNDLE_PATH=/app/vendor/bundle \
  BUNDLE_JOBS=4

RUN apk add --no-cache build-base mysql-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN if [ -z "$LOCAL_BUILD" ]; then \
  bundle install \
;fi

COPY . .
