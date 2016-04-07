#!/usr/bin/env ruby

def run(cmd)
  system(cmd)
  raise "`#{cmd}` exited non-zero (#{$?}). Exiting." if $? != 0
end

puts '<--- Creating app'
run 'rm -rf example-app'
run 'bundle exec rails new example-app --skip-gemfile --skip-bundle'
Dir.chdir('example-app')

puts '<--- Preparing app'
run 'rails g jasmine_rails:install'
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
run 'bundle exec rake spec:javascript'

puts '<--- Running browser spec'
run 'bundle exec rspec ../spec/jasmine_spec.rb'

