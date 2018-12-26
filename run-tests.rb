#!/usr/bin/env ruby

require 'fileutils'

def run(cmd)
  system(cmd)
  raise "`#{cmd}` exited non-zero (#{$?}). Exiting." if $? != 0
end

def run_in_bundle(cmd)
  gemfile_path = ENV['BUNDLE_GEMFILE'] || File.expand_path(File.join(__dir__, "Gemfile"))
  # Make sure Bundler sees the project root's Gemfile when running inside ./example-app
  run "BUNDLE_GEMFILE=#{gemfile_path} #{cmd}"
end

puts '<--- Creating app'
run 'rm -rf example-app'
run_in_bundle 'bundle install'
run_in_bundle 'bundle exec rails new example-app --skip-gemfile --skip-bundle'
Dir.chdir('example-app')
run_in_bundle 'bundle exec rails plugin new engines/myengine --full --skip-gemspec'
FileUtils.mkdir_p 'engines/myengine/spec/javascripts'

puts '<--- Preparing app'
run_in_bundle "bundle exec rails g jasmine_rails:install"
run 'rm "app/assets/javascripts/application.js"'
run 'cp "../spec/javascripts/support/jasmine.yml" "./spec/javascripts/support"'

# add bootstrap code so we don't have to copy assets into each testbed
# every time a change is made
File.open("config/application.rb", "a+") do |f|
  fixtures = File.expand_path('../spec/fixtures')
  f.puts <<-end_bootstrap
    Rails.application.config.assets.paths << "#{fixtures}/app/assets/javascripts"
    Rails.application.config.assets.paths << "#{fixtures}/vendor/assets/javascripts"
    Rails.application.config.assets.paths << "#{fixtures}/app/assets/stylesheets"
  end_bootstrap
end

puts '<--- Running rake spec:javascript'
run_in_bundle 'bundle exec rake spec:javascript'

puts '<--- Running browser spec'
run_in_bundle 'bundle exec rspec ../spec/jasmine_spec.rb'
