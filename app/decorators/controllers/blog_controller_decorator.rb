# engines/bravura_template_prime/app/decorators/controllers/blog_controller_decorator.rb

Rails.application.config.to_prepare do
  BlogController.class_eval do
    include BravuraTemplatePrime::BlogControllerConcern

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
