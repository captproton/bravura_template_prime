# engines/bravura_template_prime/app/decorators/controllers/blog_controller_decorator.rb

module BlogControllerDecorator
  extend ActiveSupport::Concern

  included do
    include BravuraTemplateBase::BlogControllerConcern
    include BravuraTemplateBase::SettingsIntegration
    include BravuraTemplatePrime::BlogControllerConcern
  end

  # Add any Prime-specific overrides here if needed
end

# Apply the decorator
BlogController.send(:include, BlogControllerDecorator) if defined?(BlogController)
