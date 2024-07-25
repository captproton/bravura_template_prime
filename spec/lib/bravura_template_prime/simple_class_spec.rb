# spec/lib/bravura_template_prime/simple_class_spec.rb
require 'rails_helper'
require 'bravura_template_prime/simple_class'

module BravuraTemplatePrime
  RSpec.describe SimpleClass, type: :class do
    describe '.hello' do
      it 'returns "Hello, world!"' do
        expect(SimpleClass.hello).to eq("Hello, world!")
      end
    end
  end
end
