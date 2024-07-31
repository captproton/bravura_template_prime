# spec/lib/bravura_template_prime/engine_spec.rb
require 'rails_helper'

RSpec.describe BravuraTemplatePrime::Engine do
  describe "registration with BravuraTemplateBase" do
    # ** FIXME: nota bene: this is part of an older approach to use the bravura_template_base gem to switch templates
    # We are using a different approach now, but this is still here for reference

    # it "responds to register_template" do
    #   expect(BravuraTemplateBase).to respond_to(:register_template)
    # end

    # it "registers the template with BravuraTemplateBase" do
    #   expect(BravuraTemplateBase).to receive(:register_template).with(:bravura_template_prime)

    #   # Simulate engine initialization
    #   BravuraTemplatePrime::Engine.initializers.select { |i| i.name == "bravura_template_prime.register_template" }.each(&:run)
    # end
  end
end
