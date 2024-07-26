# spec/spec_helper.rb

require 'bundler/setup'
Bundler.setup

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'

# Load support files
Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Enable filtering by example metadata
  config.filter_run_when_matching :focus

  # Persist example state
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Disable monkey patching
  config.disable_monkey_patching!

  # Use verbose output for single file runs
  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # Profile slow examples
  config.profile_examples = 10

  # Run specs in random order
  config.order = :random

  # Seed global randomization
  Kernel.srand config.seed

  # Include FactoryBot methods
  config.include FactoryBot::Syntax::Methods

  # Configure DatabaseCleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

  # Configure Shoulda Matchers
  Shoulda::Matchers.configure do |shoulda_config|
    shoulda_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
# Configure FactoryBot
FactoryBot.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryBot.find_definitions
