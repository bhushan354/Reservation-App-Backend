# Use an official Ruby image
FROM ruby:3.0.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock first (better caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Run server
CMD ["bash", "-c", "bundle exec rails db:create db:migrate && bundle exec rails s -b 0.0.0.0 -p 3000"]
