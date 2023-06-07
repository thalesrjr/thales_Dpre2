# syntax=docker/dockerfile:1
FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# RUN npm install --global yarn
WORKDIR /thales2_Dpre
COPY Gemfile /thales2_Dpre/Gemfile
COPY Gemfile.lock /thales2_Dpre/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]