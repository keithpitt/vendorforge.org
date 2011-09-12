#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake/dsl_definition'
require 'rake'

Vendorforge::Application.load_tasks

if %(development test).include?(Rails.env)
  require 'rspec/core'
  require 'rspec/core/rake_task'

  desc  "Run all specs with rcov"
  RSpec::Core::RakeTask.new(:rcov) do |t|
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/}
  end
end
