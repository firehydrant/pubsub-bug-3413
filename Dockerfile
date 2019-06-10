FROM ruby:2.6

RUN gem install bundler
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN bundle install

CMD rake run
