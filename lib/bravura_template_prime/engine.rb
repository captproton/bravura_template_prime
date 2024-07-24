module BravuraTemplatePrime
  class Engine < ::Rails::Engine
    isolate_namespace BravuraTemplatePrime

    config.to_prepare do
      BlogController.include BravuraTemplatePrime::BlogControllerExtensions
    end
  end
end
