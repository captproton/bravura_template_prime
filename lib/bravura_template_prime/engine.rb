# lib/bravura_template_prime/engine.rb
module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    initializer "bravura_template_prime.register_template" do
      BravuraTemplateBase.register_template(:bravura_template_prime)
    end

    initializer "bravura_template_prime.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.precompile << "bravura_template_prime/application.css"
    end

    # Asset precompilation
    initializer "bravura_template_prime.assets.precompile" do |app|
      app.config.assets.precompile += %w[ bravura_template_prime/application.css bravura_template_prime/application.js ]
    end


    # Configure generators
    config.generators do |g|
      g.test_framework :rspec
    end

    # Set up autoload paths
    config.autoload_paths << root.join("app")
    # Add the decorators directory to the autoload paths
    config.autoload_paths << config.root.join("app", "decorators")
    config.autoload_paths << config.root.join("app", "decorators", "controllers")

    # Initialize BravuraTemplatePrime-specific configurations
    initializer "bravura_template_prime.configurations" do
      # Add any BravuraTemplatePrime-specific configurations here
    end
  end
end
