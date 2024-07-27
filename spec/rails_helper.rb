# spec/rails_helper.rb

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'bravura_template_base'
require 'bravura_template_prime'
require 'bravura_template_prime/engine'
require 'shoulda-matchers'
require 'rails-controller-testing'

# Load support files
Dir[BravuraTemplatePrime::Engine.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_paths = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Include engine routes for controller tests
  config.include BravuraTemplatePrime::Engine.routes.url_helpers

  config.before(:each, type: :controller) do
    @request.env["ENGINE_ROUTES"] = BravuraTemplatePrime::Engine.routes
  end

  config.before(:each) do
    # Reset registered templates before each test
    if BravuraTemplateBase.respond_to?(:reset_templates!)
      BravuraTemplateBase.reset_templates!
    end
  end

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

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
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
