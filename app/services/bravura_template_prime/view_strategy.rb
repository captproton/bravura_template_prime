# app/services/bravura_template_prime/view_strategy.rb

module BravuraTemplatePrime
  class ViewStrategy < BravuraTemplateBase::BaseViewStrategy
    def template_for(action)
      "bravura_template_prime/blog/#{action}"
    end

    def layout
      "bravura_template_prime/application"
    end

    # Other Prime-specific view strategy methods
  end
end
