#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
Bundler::GemHelper.install_tasks

task :cd_to_dummy do
  Dir.chdir(File.expand_path("../spec/dummy", __FILE__))
end

require 'jasmine-headless-webkit'
Jasmine::Headless::Task.new(:dummy_headless_jasmine) do |t|
  t.colors = true
  t.keep_on_error = true
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:dummy_spec)

task :default => [:cd_to_dummy, :dummy_headless_jasmine, :dummy_spec]
