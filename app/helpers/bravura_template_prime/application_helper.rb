module BravuraTemplatePrime
  module ApplicationHelper
    include AuthorsHelper

    # BUTTON_STYLE_HASH = {
    #   "sharp" => "0rem",
    #   "rounded" => "99rem",
    #   "normal" => "0.5rem"
    # }

    # def cta_button_radius
    #   button_style_id = @presenter.get("settings_design.button_style_id").to_i
    #   if button_style_id > 0
    #     button_style = ButtonStyle.find(button_style_id)
    #     BUTTON_STYLE_HASH[button_style.name]
    #   else
    #     "0.5rem"
    #   end
    # end

    # def tailwind_button_classes
    #   button_style_id = @presenter.get("settings_design.button_style_id").to_i
    #   button_style_id > 0 ? ButtonStyle.find(button_style_id).style_classes : "rounded"
    # end
  end
end
