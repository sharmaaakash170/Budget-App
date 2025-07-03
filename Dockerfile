FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

WORKDIR /app 

RUN gem install bundler -v 2.3.6

COPY Gemfile Gemfile.lock ./

RUN bundle _2.3.6_ install

COPY . . 

# ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["rails", "server", "-b", "0.0.0.0"]