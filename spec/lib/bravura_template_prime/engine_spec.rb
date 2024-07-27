# spec/lib/bravura_template_prime/engine_spec.rb
require 'rails_helper'

RSpec.describe BravuraTemplatePrime::Engine do
  it "registers itself with BravuraTemplateBase" do
    expect(BravuraTemplateBase).to respond_to(:register_template)
    expect(BravuraTemplateBase).to receive(:register_template).with(:bravura_template_prime)

    # Simulate engine initialization
    BravuraTemplatePrime::Engine.initializers.select { |i| i.name == "bravura_template_prime.register_template" }.each(&:run)
  end
end
