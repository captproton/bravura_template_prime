# spec/adapters/bravura_template_prime/presentation_adapter_spec.rb

require 'rails_helper'

RSpec.describe BravuraTemplatePrime::PresentationAdapter do
  let(:settings_provider) { double('settings_provider') }
  let(:adapter) { described_class.new(settings_provider) }

  describe '#blog_hero_title' do
    it 'returns the correct setting' do
      expect(settings_provider).to receive(:get_setting).with('general.blog_hero_title').and_return('My Blog Title')
      expect(adapter.blog_hero_title).to eq('My Blog Title')
    end
  end

  describe '#blog_hero_description' do
    it 'returns the correct setting' do
      expect(settings_provider).to receive(:get_setting).with('general.blog_hero_description').and_return('My Blog Description')
      expect(adapter.blog_hero_description).to eq('My Blog Description')
    end
  end
end
