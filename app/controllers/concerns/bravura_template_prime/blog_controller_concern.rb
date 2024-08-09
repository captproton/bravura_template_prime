# engines/bravura_template_prime/app/controllers/concerns/bravura_template_prime/blog_controller_concern.rb

module BravuraTemplatePrime
  module BlogControllerConcern
    extend ActiveSupport::Concern

    included do
      before_action :set_prime_specific_variables
      before_action :set_prime_publication_constants
    end

    # Override or extend base methods as needed
    def index
      super
      @prime_featured_posts = Post.prime_featured.limit(prime_featured_post_limit)
    end

    private

    def set_prime_specific_variables
      @prime_theme = determine_prime_theme
      @prime_layout = determine_prime_layout
    end

    def determine_prime_theme
      get_setting("design.prime_theme") || "default"
    end

    def determine_prime_layout
      get_setting("design.prime_layout") || "standard"
    end

    def prime_featured_post_limit
      get_setting("feature.prime_featured_post_limit") || 5
    end

    def set_prime_publication_constants
      BravuraTemplatePrime::ConstantSetter.new(@presenter, view_context).set_all
    end

    # Add more Prime-specific methods as needed
  end
end
