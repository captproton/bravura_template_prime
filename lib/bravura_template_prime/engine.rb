module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
