# app/presenters/bravura_template_prime/presenter.rb
# app/presenters/bravura_template_prime/presenter.rb

module BravuraTemplatePrime
  class Presenter < BravuraTemplateBase::BasePresenter
    def page_title
      "#{site_name} - Prime Template"
    end

    def main_content_class
      "prime-main-content"
    end

    def header_title
      "Welcome to #{site_name} - Prime Edition"
    end

    def secondary_color
      @settings.get("design.colors.secondary") || "#6c757d"
    end

    # Override or add more Prime-specific presenter methods as needed
  end
end
