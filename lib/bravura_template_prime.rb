# lib/bravura_template_prime.rb

require "bravura_template_base"
require "bravura_template_prime/version"
require "bravura_template_prime/engine"

module BravuraTemplatePrime
  class Error < StandardError; end

  # Add any configuration options here
  mattr_accessor :some_option
  @@some_option = "default value"

  # Add a configuration block
  def self.configure
    yield self
  end

  # Add any module-level methods here
  def self.template_name
    "bravura_template_prime"
  end

  # Autoload any additional modules or classes
  autoload :SomeClass, "bravura_template_prime/some_class"
end

# Optionally, register the template here if it's not done in the engine
# BravuraTemplateBase.register_template(BravuraTemplatePrime.template_name)
