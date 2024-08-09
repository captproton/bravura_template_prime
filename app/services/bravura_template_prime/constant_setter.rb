# app/services/bravura_template_prime/constant_setter.rb

module BravuraTemplatePrime
  class ConstantSetter < BravuraTemplateBase::ConstantSetter
    def initialize(presenter, view_context)
      super
      @presenter = presenter
      @view_context = view_context
    end

    def set_all
      super
      set_prime_specific_constants
    end

    private

    def set_prime_specific_constants
      set_prime_meta_tags
      set_prime_navigation
      set_prime_footer
      set_prime_design
      set_prime_button_style
      set_prime_navigation_bar
    end

    def set_prime_meta_tags
      @view_context.instance_variable_set("@prime_meta_description", @presenter.get_setting("general.prime_meta_description"))
      @view_context.instance_variable_set("@prime_meta_title", @presenter.get_setting("general.prime_meta_title"))
    end

    def set_prime_navigation
      @view_context.instance_variable_set("@prime_logo_text", @presenter.get_setting("navigation.prime_logo_text"))
    end

    def set_prime_footer
      @view_context.instance_variable_set("@prime_copyright_notice", @presenter.get_setting("footer.prime_copyright"))
      @view_context.instance_variable_set("@prime_sitemap", @presenter.get_setting("footer.prime_sitemap"))
    end

    def set_prime_design
      @view_context.instance_variable_set("@prime_blog_theme", @presenter.get_setting("design.prime_blog_theme"))
      set_prime_site_mode
      set_prime_shade_of_gray
      @view_context.instance_variable_set("@prime_heading_font", @presenter.get_setting("design.prime_heading_font"))
      @view_context.instance_variable_set("@prime_content_font", @presenter.get_setting("design.prime_content_font"))
      @view_context.instance_variable_set("@prime_font_family", @presenter.get_setting("design.prime_font_family"))
    end

    def set_prime_site_mode
      site_mode_id = @presenter.get_setting("design.prime_site_mode")
      site_mode = SiteMode.find_by(id: site_mode_id)
      @view_context.instance_variable_set("@prime_site_mode", site_mode)
      @view_context.instance_variable_set("@prime_site_mode_theme", site_mode&.site_theme || "system")
    end

    def set_prime_shade_of_gray
      shade_of_gray_id = @presenter.get_setting("design.prime_shades_of_gray_id")
      shade_of_gray = ShadesOfGray.find_by(id: shade_of_gray_id)
      @view_context.instance_variable_set("@prime_shade_of_gray", shade_of_gray)
      @view_context.instance_variable_set("@prime_shade_of_gray_name", shade_of_gray&.name&.capitalize || "Normal")
    end

    def set_prime_button_style
      button_style_id = @presenter.get_setting("design.prime_button_style_id")
      button_style = ButtonStyle.find_by(id: button_style_id)
      button_style_name = button_style&.name || "normal"
      @view_context.instance_variable_set("@prime_button_radius", set_prime_button_radius(button_style_name))
    end

    def set_prime_button_radius(button_style)
      case button_style
      when "normal" then "0.25rem"
      when "rounded" then "9999px"
      when "sharp" then "0rem"
      else "0.25rem"
      end
    end

    def set_prime_navigation_bar
      navigation_bar_id = @presenter.get_setting("design.prime_navigation_bar_id")
      navigation_bar = NavigationBar.find_by(id: navigation_bar_id)
      @view_context.instance_variable_set("@prime_navigation_bar", navigation_bar)
      @view_context.instance_variable_set("@prime_navigation_bar_name", navigation_bar&.name || "center")
    end
  end
end
