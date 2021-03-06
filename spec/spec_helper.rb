require_relative '../lib/ashpool'
require 'timecop'
require 'aruba/rspec'
require 'pry'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.around(:each) do |example|
    Timecop.freeze(Time.local(1990)) { example.run }
  end

  config.after(:each) do
    FileUtils.rm_rf(Dir['tmp/aruba/*'])
  end
end
