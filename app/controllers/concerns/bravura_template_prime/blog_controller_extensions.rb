module BravuraTemplatePrime
  module BlogControllerExtensions
    extend ActiveSupport::Concern

    included do
      before_action :set_prime_specific_data, only: [ :index, :show ]
    end

    def set_prime_specific_data
      @prime_presenter = BravuraTemplatePrime::PresentationAdapter.new(self)
      @prime_specific_data = "This is added by BravuraTemplatePrime"
    end

    def index
      super # Call the original method
      @prime_specific_data = "This is added by BravuraTemplatePrime"
    end

    def prime_specific_method
      # Some functionality specific to BravuraTemplatePrime
    end

    private

    def some_private_helper_method
      # Helper method for use within this concern
    end
  end
end
