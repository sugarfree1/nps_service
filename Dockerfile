FROM ruby:2.6.9-alpine

RUN apk add --no-cache build-base postgresql postgresql-dev libpq

WORKDIR /app
COPY . /app
RUN bundle install -j $(nproc) --quiet

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]
