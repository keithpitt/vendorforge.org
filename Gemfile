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

# Running multiple proccess easier
gem 'foreman'

# I need parts of vendor to do awesome stuff
gem 'vendor', :git => 'git://github.com/keithpitt/vendor.git'

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

group :development, :test do

  # Deploying on Heroku
  gem 'heroku'

  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'

  # Cucumber for testing
  gem 'cucumber-rails'

  # I like to have a clean ship
  gem 'database_cleaner'

  # Headless testing
  gem 'capybara-webkit', :git => 'git://github.com/thoughtbot/capybara-webkit.git'

  # Rails love for RSpec
  gem 'rspec-rails', '2.7.0'

  # For easier tests
  gem 'shoulda-matchers'

  # Mocking/stubbing
  gem 'rr'

  # Generating testing + dummy data
  gem 'factory_girl_rails'
  gem 'forgery'

  # Code coverage
  gem 'rcov'

end

group :test_mac do

  # Growl integration
  gem 'growl'

  # Something for something
  gem 'rb-fsevent'

  # Better rspec formatter
  gem 'fuubar'

end
