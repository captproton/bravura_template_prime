module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    initializer "bravura_template_prime.register_template" do
      BravuraTemplateBase.register_template(:bravura_template_prime)
    end

    initializer "bravura_template_prime.assets.precompile" do |app|
      app.config.assets.precompile += %w( bravura_template_prime/application.css bravura_template_prime/application.js )
    end

    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths << File.expand_path("../../app/controllers", __dir__)
  end
end
