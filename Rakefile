require "bundler/setup"

APP_RAKEFILE = File.expand_path("spec/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end

  task default: :spec
rescue LoadError
  # no rspec available
end

task :prepare_dummy_db do
  ENV['RAILS_ENV'] = 'test'
  require File.expand_path('spec/dummy/config/environment.rb', __dir__)
  ActiveRecord::Base.logger = nil  # Silence SQL output
  Rake::Task['app:db:test:prepare'].invoke
end

Rake::Task[:spec].enhance([ 'prepare_dummy_db' ])

# Silence the Rake task list output
Rake::Task.tasks.each do |task|
  task.actions.unshift proc { |t, args|
    Rake.verbose(false) if !task.name.start_with?("spec", "rspec", "default")
  }
end
