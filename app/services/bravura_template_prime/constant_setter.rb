# app/services/bravura_template_prime/constant_setter.rb
module BravuraTemplatePrime
  class ConstantSetter < BravuraTemplateBase::ConstantSetter
    def set_all
      super
      set_prime_specific_constants
    end

    private

    def set_prime_specific_constants
      # Set any Prime-specific constants
    end
  end
end
