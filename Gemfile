source "https://rubygems.org"


# Specify your gem's dependencies in bravura_template_prime.gemspec.
gemspec

gem "puma"

gem "sqlite3"

gem "sprockets-rails"

# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false


# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

#  app-specific gems
gem "bravura_template_base", github: "captproton/bravura_template_base", branch: "feature/troubleshoot_blog_index"


group :development, :test do
  gem "rspec-rails", "~> 6.1.3"
  gem "factory_bot_rails", "~> 6.4.3"
  gem "faker", "~> 3.4.2"
  gem "capybara", "~> 3.40.0"
  gem "database_cleaner-active_record", "~> 2.2"

  #   gem 'simplecov', '~> 0.22.0', require: false
  gem "shoulda-matchers", "~> 6.2.0", require: false
  gem "rails-controller-testing", "~> 1.0"
end
