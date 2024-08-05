# app/controllers/concerns/bravura_template_prime/blog_controller_concern.rb

module BravuraTemplatePrime
  module BlogControllerConcern
    extend ActiveSupport::Concern

    included do
      before_action :set_view_strategy
      before_action :load_settings_and_presenter
      before_action :set_publication_constants
    end

    private

    def set_view_strategy
      strategy_name = params[:use_next_template] ? :next : :prime
      @view_strategy = BravuraTemplatePrime::ViewStrategyFactory.create(strategy_name)
    end

    def load_settings_and_presenter
      @settings ||= BravuraTemplateBase::GuaranteedSettingService.for_account(ActsAsTenant.current_tenant)
      @presenter = BravuraTemplatePrime::PaloozaPresenter.new(@settings)
    end

    def set_publication_constants
      BravuraTemplatePrime::ConstantSetter.new(@presenter, view_context).set_all
    end

    def render_with_strategy(action)
      render template: @view_strategy.template_for(action), layout: @view_strategy.layout
    end
  end
end
