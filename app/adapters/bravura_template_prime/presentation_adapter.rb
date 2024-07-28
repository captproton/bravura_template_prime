# app/adapters/bravura_template_prime/presentation_adapter.rb
module BravuraTemplatePrime
  class PresentationAdapter
    def initialize(settings_provider)
      @settings_provider = settings_provider
    end

    def get_setting(key)
      if @settings_provider.respond_to?(:get_setting)
        @settings_provider.get_setting(key)
      else
        # Fallback for when we're not in a controller context (like in view specs)
        "Placeholder for #{key}"
      end
    end

    def blog_hero_title
      get_setting("general.blog_hero_title")
    end

    def blog_hero_description
      get_setting("general.blog_hero_description")
    end

    # Add more methods for commonly used settings
  end
end
