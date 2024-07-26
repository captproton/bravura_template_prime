# spec/lib/bravura_template_prime/engine_spec.rb

require 'rails_helper'

RSpec.describe BravuraTemplatePrime::Engine do
  it "registers itself with BravuraTemplateBase" do
    expect(BravuraTemplateBase.templates).to include(:bravura_template_prime)
  end
end
