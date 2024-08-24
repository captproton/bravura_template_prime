# engines/bravura_template_prime/app/helpers/bravura_template_prime/newsletter_helper.rb
module BravuraTemplatePrime
  module NewsletterHelper
    def newsletter_banner(position)
      return unless Current.account
      settings = Current.account.settings_email_newsletter_setup
      return unless settings
      show_banner = case position
      when :header
                      settings.header_enabled
      when :footer
                      settings.footer_enabled
      else
                      false
      end
      return unless show_banner
      headline = (position == :header) ? settings.header_headline : settings.footer_headline
      text = (position == :header) ? settings.header_text : settings.footer_text
      disclaimer = (position == :header) ? settings.header_disclaimer : settings.footer_disclaimer
      render partial: "bravura_template_prime/shared/newsletter_banner", locals: {
        position: position,
        headline: headline,
        text: text,
        disclaimer: disclaimer,
        webhook_url: settings.webhook_url,
        webhook_bearer_token: settings.webhook_bearer_token,
        email_verification: settings.email_verification
      }
    end
  end
end
