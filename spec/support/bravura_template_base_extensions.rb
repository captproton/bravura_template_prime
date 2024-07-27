# spec/support/bravura_template_base_extensions.rb

module BravuraTemplateBase
  def self.reset_templates!
    @registered_templates = [] if @registered_templates
  end
end

require 'rails_helper'

RSpec.configure do |config|
  config.before(:each) do
    BravuraTemplateBase.reset_templates!
  end
end
