ENV["RAILS_ENV"] ||= 'test'
require Rails.root.join('config/environment')
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'jasmine_rails/rspec'

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
    find('.bar.passed,.bar.passingAlert')
  end
end

describe JasmineRails::SaveFixture do
  describe '#save_fixture' do
    let(:fixture_contents) { '<div class="generated_content">sample generated fixture</div>' }
    after do
      require 'fileutils'
      FileUtils.rm_rf 'spec/javascripts/fixtures'
    end
    before do
      save_fixture 'example.html', fixture_contents
    end
    it 'saves file to spec/javascripts/fixtures/generated' do
      expect(File.read(Rails.root.join('spec/javascripts/fixtures/generated/example.html'))).to include fixture_contents
    end
    it 'ignores spec/javascripts/fixtures/generated directory from version control' do
      expect(File.read(Rails.root.join('spec/javascripts/fixtures/.gitignore'))).to include "generated"
    end
  end
end
