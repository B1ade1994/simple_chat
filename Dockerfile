FROM ruby:3.2.2

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/
RUN bundle exec rake assets:precompile

ENTRYPOINT ["sh", "/rails/bin/docker-entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]
