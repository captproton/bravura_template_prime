# bravura_template_prime/app/controllers/concerns/bravura_template_prime/blog_controller_extensions.rb
module BravuraTemplatePrime
  module BlogControllerExtensions
    extend ActiveSupport::Concern

    included do
      # This block will be executed in the context of the BlogController
      before_action :set_prime_specific_data, only: [ :index, :show ]
    end

    # Add new methods or override existing ones
    def set_prime_specific_data
      @prime_presenter = BravuraTemplatePrime::PresentationAdapter.new(self)
    end

    # You can also override existing methods
    def index
      super  # Call the original method
      @prime_specific_data = "This is added by BravuraTemplatePrime"
    end
  end
end
