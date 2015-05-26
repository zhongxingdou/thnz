FROM ruby:2.2.2

RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm- rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.1

RUN gem install rails --version "$RAILS_VERSION"

VOLUMN . /var/www/app

WORKDIR /var/www/app

EXPOSE 3000

ENV PORT=3000

CMD ["unicorn"]

RUN bundle install

RUN RAILS_ENV=development rake db:create db:migrate
