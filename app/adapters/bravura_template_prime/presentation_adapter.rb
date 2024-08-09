# app/adapters/bravura_template_prime/presentation_adapter.rb
require "bravura_template_base/guaranteed_setting_service"

module BravuraTemplatePrime
  class PresentationAdapter
    def initialize(settings_provider = nil)
      @settings_provider = settings_provider || BravuraTemplateBase::GuaranteedSettingService.new
    end

    def get_setting(key)
      @settings_provider.get_setting(key)
    rescue NoMethodError
      # Fallback for when we're not in a controller context (like in view specs)
      "Placeholder for #{key}"
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
