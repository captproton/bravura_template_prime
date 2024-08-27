module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    initializer "bravura_template_prime.register_template" do
      BravuraTemplateBase.register_template(:bravura_template_prime)
    end

    initializer 'bravura_template_prime.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper BravuraTemplatePrime::AuthorsHelper
        helper BravuraTemplatePrime::BlogHelper
      end
    end

    initializer "bravura_template_prime.assets" do |app|
      app.config.assets.paths << root.join("app", "assets")
      app.config.assets.paths << root.join("app", "assets", "images")
      app.config.assets.paths << root.join("app", "assets", "stylesheets")
      app.config.assets.paths << root.join("app", "javascript")

      # Precompile all CSS and JS files in the bravura_template_prime directory
      app.config.assets.precompile += %w[ bravura_template_prime/**/*.css bravura_template_prime/**/*.js ]

      # Precompile all images in the bravura_template_prime directory
      app.config.assets.precompile += %w[ bravura_template_prime/**/*.png bravura_template_prime/**/*.jpg bravura_template_prime/**/*.gif bravura_template_prime/**/*.svg ]
    end
    # Configure generators
    config.generators do |g|
      g.test_framework :rspec
    end

    # Set up autoload paths
    config.autoload_paths << root.join("app")
    config.autoload_paths << root.join("app", "presenters")
    config.autoload_paths += %W[#{config.root}/app/decorators]
    config.autoload_paths += %W[#{config.root}/app/decorators/controllers]

    # Initialize BravuraTemplatePrime-specific configurations
    initializer "bravura_template_prime.configurations" do
      # Add any BravuraTemplatePrime-specific configurations here
    end

    # Ensure engine assets are precompiled
    initializer "bravura_template_prime.assets.precompile" do |app|
      app.config.assets.precompile += %w[bravura_template_prime_manifest.js]
    end
  end
end
