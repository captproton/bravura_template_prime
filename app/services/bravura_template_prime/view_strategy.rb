module BravuraTemplatePrime
  class ViewStrategy < BravuraTemplateBase::BaseViewStrategy
    def template_for(action)
      if @settings.design.some_prime_specific_setting
        "bravura_template_prime/custom/#{action}"
      else
        super
      end
    end

    # Override other methods as needed for Prime-specific behavior
  end
end
