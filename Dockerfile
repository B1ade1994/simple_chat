FROM ruby:3.2.2

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
