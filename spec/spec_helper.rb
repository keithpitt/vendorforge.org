require 'rubygems'
require 'spork'

Spork.prefork do

  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'factory_girl'
  require 'forgery'
  require 'json'
  require 'carrierwave/test/matchers'


  RSpec.configure do |config|
    config.mock_with :rr
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
  end

end

Spork.each_run do

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

end
