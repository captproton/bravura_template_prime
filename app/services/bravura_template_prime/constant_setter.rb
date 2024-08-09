# app/services/bravura_template_prime/constant_setter.rb
module BravuraTemplatePrime
  class ConstantSetter < BravuraTemplateBase::ConstantSetter
    def initialize(presenter, view_context)
      super
      # No need to reassign @presenter and @view_context as they're already set by super
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
      set_instance_variable("@prime_meta_description", "general.prime_meta_description")
      set_instance_variable("@prime_meta_title", "general.prime_meta_title")
    end

    def set_prime_navigation
      set_instance_variable("@prime_logo_text", "navigation.prime_logo_text")
    end

    def set_prime_footer
      set_instance_variable("@prime_copyright_notice", "footer.prime_copyright")
      set_instance_variable("@prime_sitemap", "footer.prime_sitemap")
    end

    def set_prime_design
      set_instance_variable("@prime_blog_theme", "design.prime_blog_theme")
      set_prime_site_mode
      set_prime_shade_of_gray
      set_instance_variable("@prime_heading_font", "design.prime_heading_font")
      set_instance_variable("@prime_content_font", "design.prime_content_font")
      set_instance_variable("@prime_font_family", "design.prime_font_family")
    end

    def set_prime_site_mode
      site_mode_id = @presenter.get("design.prime_site_mode")
      site_mode = find_record(SiteMode, site_mode_id)
      set_instance_variable("@prime_site_mode", site_mode)
      set_instance_variable("@prime_site_mode_theme", site_mode&.site_theme || "system")
    end

    def set_prime_shade_of_gray
      shade_of_gray_id = @presenter.get("design.prime_shades_of_gray_id")
      shade_of_gray = find_record(ShadesOfGray, shade_of_gray_id)
      set_instance_variable("@prime_shade_of_gray", shade_of_gray)
      set_instance_variable("@prime_shade_of_gray_name", shade_of_gray&.name&.capitalize || "Normal")
    end

    def set_prime_button_style
      button_style_id = @presenter.get("design.prime_button_style_id")
      button_style = find_record(ButtonStyle, button_style_id)
      button_style_name = button_style&.name || "normal"
      set_instance_variable("@prime_button_radius", set_prime_button_radius(button_style_name))
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
      navigation_bar_id = @presenter.get("design.prime_navigation_bar_id")
      navigation_bar = find_record(NavigationBar, navigation_bar_id)
      set_instance_variable("@prime_navigation_bar", navigation_bar)
      set_instance_variable("@prime_navigation_bar_name", navigation_bar&.name || "center")
    end

    def set_instance_variable(var_name, setting_key)
      @view_context.instance_variable_set(var_name, @presenter.get(setting_key))
    end

    def find_record(model, id)
      model.find_by(id: id)
    end
  end
end
