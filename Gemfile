source 'http://rubygems.org'

# Use latest rack to get rid of pesky errors
gem 'rack', '~> 1.3.5'

# Rails 3.1, oooer
gem 'rails', '3.1.1'

# Postgres database
gem 'pg'

# jQuery for rails
gem 'jquery-rails'

# Authentication with devise
gem 'devise'

# File Uploads
gem 'carrierwave'

# And storage on S3
gem 'fog'

# Unzipping pants
gem 'rubyzip'

# For better ActiveRecord searching
gem "squeel"

# I need parts of vendor to do awesome stuff
gem 'vendor', :git => 'git://github.com/keithpitt/vendor.git'

# Capture errors
gem 'airbrake'

# Text formatting
gem 'redcarpet'

# Posting to twitter
gem 'twitter'

# And shortening URLS for twitter
gem 'is-gd-shrinker'

# For background stuffs
gem 'resque'

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  # Sass stylesheets
  gem 'sass-rails', "  ~> 3.1.0"

  # Coffeescript for nicer JavaScript
  gem 'coffee-rails', "~> 3.1.0"

  # Compressionn gem for CSS/JavaScript
  gem 'uglifier'

end

group :development do

  # Running multiple proccess easier
  gem 'foreman'

  # Gaurd for easier development (with things like spork)
  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

  # For guard rspec and cucumber support
  gem 'guard-rspec', :git => "git://github.com/guard/guard-rspec.git"
  gem 'guard-cucumber', :git => "git://github.com/guard/guard-cucumber.git"
  gem 'guard-bundler'

  # Deploying on Heroku
  gem 'heroku'

end

group :development, :test do


  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'

  # Cucumber for testing
  gem 'cucumber-rails'

  # Rails love for RSpec
  gem 'rspec-rails', '2.7.0'

  # So we can use guard to run spork
  gem 'spork', :git => "git://github.com/chrismdp/spork.git"
  gem 'guard-spork', :git => "git://github.com/guard/guard-spork.git"

end

group :test do

  # Better rspec formatter
  gem 'fuubar'

  # Headless testing
  gem 'capybara-webkit', :git => 'git://github.com/thoughtbot/capybara-webkit.git'

  # Testing Resque
  gem 'resque_spec'

  # Code coverage
  gem 'rcov'

  # For easier tests
  gem 'shoulda-matchers'

  # Generating testing + dummy data
  gem 'factory_girl_rails', :require => false

  # For fake data
  gem 'forgery'

  # I like to have a clean ship
  gem 'database_cleaner'

  # Growl integration
  gem 'growl'

end
