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

    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths << File.expand_path("../../app/controllers", __dir__)
  end
end
