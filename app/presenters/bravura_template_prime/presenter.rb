# app/presenters/bravura_template_prime/presenter.rb
module BravuraTemplatePrime
  class Presenter < BravuraTemplateBase::BasePresenter
    def get(key)
      @settings.get(key)
    end

    # Other Prime-specific methods...
  end
end
