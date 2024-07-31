module BravuraTemplatePrime
  # class MockBlogController < ActionController::Base
  #   # ** FIXME: nota bene: this is part of an older approach to use the bravura_template_base gem to switch templates
  #   # We are using a different approach now, but this is still here for reference
  #   # include BravuraTemplateBase::BlogControllerConcern if defined?(BravuraTemplateBase::BlogControllerConcern)
  #   include BravuraTemplatePrime::BlogControllerExtensions

  #   def index
  #     @posts = []
  #     @presenter = BravuraTemplatePrime::PresentationAdapter.new(self)
  #     @prime_specific_data = "This is added by BravuraTemplatePrime"
  #     render template: 'bravura_template_prime/blog/index'
  #   end

  #   def show
  #     @post = OpenStruct.new(id: params[:id], title: "Test Post")
  #     @presenter = BravuraTemplatePrime::PresentationAdapter.new(self)
  #     render template: 'bravura_template_prime/blog/show'
  #   end

  #   private

  #   def current_account
  #     OpenStruct.new(id: 1, name: "Test Account")
  #   end

  #   def all_settings
  #     {}
  #   end

  #   def get_setting(key)
  #     nil
  #   end
  # end
end
