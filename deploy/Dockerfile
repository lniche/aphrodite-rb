FROM ruby:3.3.5-alpine

RUN apk update && apk add --no-cache build-base postgresql-dev tzdata

ENV RAILS_ENV=production

RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem sources -l

WORKDIR /app

COPY . .

RUN if [ -f .env.example ]; then cp .env.example .env; fi

RUN bundle install --without development test

EXPOSE 8000

CMD ["rails", "server"]
