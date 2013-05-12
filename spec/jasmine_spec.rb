ENV["RAILS_ENV"] ||= 'test'
require Rails.root.join('config/environment')
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :inspector => true)
end

Capybara.default_driver = :poltergeist

RSpec.configure do |config|
  config.include Capybara::DSL
end

describe "Jasmine" do
  specify do
    visit '/jasmine'
    find('.passingAlert').should have_content "Passing"
  end
end
