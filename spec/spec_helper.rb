require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])

SimpleCov.start

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'sinatra/activerecord'
require_relative '../app'
require_relative 'back_end/features/web_helpers.rb'

Capybara.app = MakersBnB

Capybara.default_driver = :selenium
Capybara.server = :webrick

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.execute('TRUNCATE users, spaces, requests')
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
