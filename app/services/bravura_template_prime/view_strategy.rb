# app/presenters/bravura_template_base/base_presenter.rb

module BravuraTemplatePrime
  class ViewStrategy < BravuraTemplateBase::BaseViewStrategy
    def template_for(action)
      "bravura_template_prime/#{action}"
    end

    def layout
      "bravura_template_prime/application"
    end

    # Other Prime-specific view strategy methods
  end
end
