require 'rails_helper'

RSpec.describe BravuraTemplatePrime::Engine do
  describe "registration with BravuraTemplateBase" do
    it "precompiles assets" do
      css_assets = Dir[Rails.root.join('app/assets/stylesheets/bravura_template_prime/**/*.css')].map do |path|
        path.sub(Rails.root.join('app/assets/stylesheets/').to_s, '')
      end

      js_assets = Dir[Rails.root.join('app/assets/javascripts/bravura_template_prime/**/*.js')].map do |path|
        path.sub(Rails.root.join('app/assets/javascripts/').to_s, '')
      end

      precompiled_assets = Rails.application.config.assets.precompile

      css_assets.each do |asset|
        expect(precompiled_assets).to include(asset)
      end

      js_assets.each do |asset|
        expect(precompiled_assets).to include(asset)
      end
    end

    it "sets up RSpec as the test framework" do
      expect(BravuraTemplatePrime::Engine.config.generators.options[:rails][:test_framework]).to eq :rspec
    end

    it "sets up autoload paths" do
      expect(BravuraTemplatePrime::Engine.config.autoload_paths).to include(
        BravuraTemplatePrime::Engine.root.join("app")
      )
    end

    it "includes the correct JavaScript path" do
      expect(Rails.application.config.assets.paths).to include(
        BravuraTemplatePrime::Engine.root.join("app/javascript")
      )
    end
  end
end
