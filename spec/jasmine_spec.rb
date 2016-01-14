ENV["RAILS_ENV"] ||= 'test'
require Rails.root.join('config/environment')
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'jasmine_rails/rspec'
require 'jasmine-core/version'

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

def jasmine_maijor_version
  Jasmine::Core::VERSION.split('.').first.to_i
end

def create_fixture_file(file_name, content = rendered)
  fixture_path = File.join(JasmineRails.fixtures_dir, file_name)
  fixture_directory = File.dirname(fixture_path)
  FileUtils.mkdir_p fixture_directory unless File.exists?(fixture_directory)

  File.open(fixture_path, 'w') do |file|
    file.puts(content)
  end
end


describe "Jasmine" do
  specify do
    visit '/specs'
    if jasmine_maijor_version >= 2
      find('.jasmine-bar.jasmine-passed,.jasmine-bar.jasmine-passingAlert')
    else
      find('.bar.passed,.bar.passingAlert')
    end
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

describe "JasmineRails::HtmlFixtures" do
  describe 'Save html fixture' do
    let(:jasmine_config) do
      {
        'fixtures_path' => 'spec/javascripts/fixtures',
        'tmp_dir' => Rails.root.join('tmp/jasmine'),
        'html_fixtures' => ['example.html']
      }
    end
    let(:rendered_fixture) do
      File.join(JasmineRails.tmp_dir, JasmineRails.route_path, JasmineRails.fixtures_path, 'example.html')
    end
    let(:fixture_contents) { '<div class="generated_content">sample generated fixture</div>' }
    
    before do
      allow(JasmineRails).to receive(:jasmine_config).and_return(jasmine_config)
      create_fixture_file 'example.html', fixture_contents

      JasmineRails::OfflineAssetPaths.disabled = false
    end

    after do
      require 'fileutils'
      FileUtils.rm_rf JasmineRails.fixtures_dir
      FileUtils.rm_rf JasmineRails.tmp_dir

      JasmineRails::OfflineAssetPaths.disabled = true
    end

    it 'render files to tmp/jasmine' do
      app = ActionDispatch::Integration::Session.new(Rails.application)
      JasmineRails::OfflineAssetPaths.disabled = false
      
      JasmineRails::Runner.send(:preload_spec_fixtures, app)
      expect(File.read(rendered_fixture)).to include fixture_contents
    end
  end
end