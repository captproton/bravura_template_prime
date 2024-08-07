class BlogController < ApplicationController
  include BravuraTemplatePrime::BlogControllerConcern

  def index
    @general_blog_hero_title = @presenter.get_setting("general.blog_hero_title")
    render_with_strategy(:index)
  end

  def show
    render_with_strategy(:show)
  end

  def featured
    render_with_strategy(:featured)
  end

  def archives
    render_with_strategy(:archives)
  end

  private

  def render_with_strategy(action)
    @rendered_template = @view_strategy.template_for(action)
    @rendered_layout = @view_strategy.layout

    # In test environment, don't actually render
    return head :ok if Rails.env.test?

    render template: @rendered_template, layout: @rendered_layout
  end
end
