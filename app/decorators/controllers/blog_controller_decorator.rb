# app/decorators/controllers/blog_controller_decorator.rb

module BravuraTemplatePrime
  module BlogControllerDecorator
    def self.prepended(base)
      base.include BravuraTemplatePrime::BlogControllerConcern
    end

    def index
      super
      @general_blog_hero_title = @presenter.get_setting("general.blog_hero_title")
      render_with_strategy(:index)
    end

    def show
      super
      render_with_strategy(:show)
    end

    def featured
      super
      render_with_strategy(:featured)
    end

    def archives
      super
      render_with_strategy(:archives)
    end
  end
end

# This will apply the decorator only when BlogController is defined
ActiveSupport.on_load(:action_controller) do
  if defined?(BlogController)
    BlogController.prepend BravuraTemplatePrime::BlogControllerDecorator
  end
end
