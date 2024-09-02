module BravuraTemplatePrime
  class ApplicationController < ::ApplicationController
    include BravuraTemplateBase::BaseControllerConcern
    helper BravuraTemplatePrime::ApplicationHelper
    include BravuraTemplatePrime::ApplicationHelper

    before_action :load_settings_and_presenter

    def cta_button_radius
      "0.5rem"
    end
  end

end
