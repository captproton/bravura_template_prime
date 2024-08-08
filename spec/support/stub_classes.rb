# spec/support/stub_classes.rb
require 'ostruct'

module BravuraTemplateBase
  class GuaranteedSettingService
    def self.for_account(account)
      # Return a stub object
      OpenStruct.new
    end
  end

  class BaseViewStrategy
    def initialize(settings, options = {})
      @settings = settings
      @options = options
    end

    def template_for(action)
      "bravura_template_#{@settings.design.template}/#{action}"
    end

    def layout
      "bravura_template_#{@settings.design.template}/application"
    end
  end
end

module BravuraTemplatePrime
  class ViewStrategyFactory
    def self.create(strategy_name)
      # Return a stub ViewStrategy
      OpenStruct.new(
        template_for: ->(action) { "bravura_template_prime/#{action}" },
        layout: 'bravura_template_prime/application'
      )
    end
  end

  class PaloozaPresenter
    def initialize(settings)
      # Dummy initializer
    end

    def get_setting(key)
      # Return dummy settings
      "Dummy Setting"
    end
  end

  class ViewStrategy
    def template_for(action)
      "bravura_template_prime/#{action}"
    end

    def layout
      'bravura_template_prime/application'
    end
  end
end

# Stub for ActsAsTenant if it's being used
module ActsAsTenant
  def self.current_tenant
    OpenStruct.new
  end
end
