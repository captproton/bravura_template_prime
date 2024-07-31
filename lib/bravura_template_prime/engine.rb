# lib/bravura_template_prime/engine.rb
module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    # ** FIXME: nota bene: this is part of an older approach to use the bravura_template_base gem to switch templates
    # We are using a different approach now, but this is still here for reference
    # initializer "bravura_template_prime.register_template" do
    #   BravuraTemplateBase.register_template(:bravura_template_prime)
    # end

    initializer "bravura_template_prime.assets.precompile" do |app|
      app.config.assets.precompile += %w[ bravura_template_prime/application.css bravura_template_prime/application.js ]
    end

    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths << File.expand_path("../../app/controllers", __dir__)
  end
end
