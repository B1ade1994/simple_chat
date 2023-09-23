FROM ruby:3.2.2

WORKDIR /simple_chat

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/

ENTRYPOINT ["sh", "/simple_chat/bin/docker-entrypoint.sh"]

EXPOSE 3000
