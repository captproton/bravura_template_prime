# app/helpers/bravura_template_prime/blog_helper.rb
module BravuraTemplatePrime
  module BlogHelper
    def author_avatar_url(author, size)
      if author.avatar.present?
        url_for(author.avatar.variant(resize: "#{size}x#{size}"))
      else
        asset_path("bravura_template_prime/default_avatar.jpg")
      end
    end
  end
end
