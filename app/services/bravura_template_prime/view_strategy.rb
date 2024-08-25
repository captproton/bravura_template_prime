# app/services/bravura_template_prime/view_strategy.rb
module BravuraTemplatePrime
  class ViewStrategy < BravuraTemplateBase::BaseViewStrategy
    def initialize(settings:, controller_name:, **options)
      super(settings)
      @controller_name = controller_name
      @options = options
    end

    def template_for(action)
      "bravura_template_prime/#{@controller_name}/#{action}"
    end

    def layout
      "bravura_template_prime/application"
    end

    # Other Prime-specific view strategy methods

    private

    def set_controller_name(controller_name)
      @controller_name = controller_name
    end
  end
end
