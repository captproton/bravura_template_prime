module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths << File.expand_path("../../app/controllers", __dir__)

  end
end
