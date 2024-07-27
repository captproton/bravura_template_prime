# bravura_template_prime/app/controllers/concerns/bravura_template_prime/blog_controller_extensions.rb

module BravuraTemplatePrime
  module BlogControllerExtensions
    extend ActiveSupport::Concern

    included do
      before_action :set_prime_specific_data, only: [ :index, :show ]
      helper_method :prime_specific_helper
    end

    def set_prime_specific_data
      @prime_presenter = BravuraTemplatePrime::PresentationAdapter.new(self)
    end

    def index
      super
      @prime_specific_data = "This is added by BravuraTemplatePrime"
    end

    def show
      super
      # Add any Prime-specific customizations for the show action
    end

    private

    def prime_specific_helper
      # This method will be available in views
      "I'm a helper method specific to BravuraTemplatePrime"
    end
  end
end
