#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
Bundler::GemHelper.install_tasks

task :run_jasmine_rake_in_dummy do
  system <<-BASH
    cd spec/dummy
    bundle exec rake spec:javascript
  BASH
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:run_browser_spec_in_dummy)

task :default => [:run_jasmine_rake_in_dummy, :run_browser_spec_in_dummy]
