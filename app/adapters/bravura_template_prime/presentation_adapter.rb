# app/adapters/bravura_template_prime/presentation_adapter.rb
module BravuraTemplatePrime
  class PresentationAdapter
    def initialize(settings_provider)
      @settings_provider = settings_provider
    end

    def get_setting(key)
      @settings_provider.get_setting(key)
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
