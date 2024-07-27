module BravuraTemplatePrime
  class ApplicationController < ActionController::Base
    include BravuraTemplateBase::SettingsIntegration

    before_action :set_view_paths

    private

    def set_view_paths
      prepend_view_path "app/views/bravura_template_prime"
    end
  end
end
