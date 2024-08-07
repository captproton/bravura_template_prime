require 'rails_helper'

RSpec.describe BlogController, type: :controller do
  routes { Rails.application.routes }

  let(:settings) { instance_double(BravuraTemplateBase::GuaranteedSettingService) }
  let(:presenter) { instance_double(BravuraTemplatePrime::PaloozaPresenter) }
  let(:view_strategy) { instance_double(BravuraTemplatePrime::ViewStrategy) }
  let(:constant_setter) { instance_double(BravuraTemplatePrime::ConstantSetter) }

  before do
    allow(BravuraTemplateBase::GuaranteedSettingService).to receive(:for_account).and_return(settings)
    allow(BravuraTemplatePrime::PaloozaPresenter).to receive(:new).and_return(presenter)
    allow(BravuraTemplatePrime::ViewStrategyFactory).to receive(:create).and_return(view_strategy)
    allow(BravuraTemplatePrime::ConstantSetter).to receive(:new).and_return(constant_setter)
    allow(constant_setter).to receive(:set_all)
    allow(presenter).to receive(:get_setting).with("general.blog_hero_title").and_return("Test Title")
    allow(ActsAsTenant).to receive(:current_tenant).and_return(OpenStruct.new)
    allow(view_strategy).to receive(:template_for).and_return("bravura_template_prime/template")
    allow(view_strategy).to receive(:layout).and_return("bravura_template_prime/application")
  end

  shared_examples "a blog action" do |action|
    it "sets the view strategy" do
      get action, params: { id: 1 } if action == :show
      get action if action != :show
      expect(assigns(:view_strategy)).to eq(view_strategy)
    end

    it "loads settings" do
      get action, params: { id: 1 } if action == :show
      get action if action != :show
      expect(assigns(:settings)).to eq(settings)
    end

    it "loads presenter" do
      get action, params: { id: 1 } if action == :show
      get action if action != :show
      expect(assigns(:presenter)).to eq(presenter)
    end

    it "sets publication constants" do
      expect(constant_setter).to receive(:set_all)
      get action, params: { id: 1 } if action == :show
      get action if action != :show
    end

    it "calls template_for on view_strategy with correct action" do
      expect(view_strategy).to receive(:template_for).with(action).and_return("bravura_template_prime/#{action}")
      get action, params: { id: 1 } if action == :show
      get action if action != :show
    end

    it "calls layout on view_strategy" do
      expect(view_strategy).to receive(:layout).and_return("bravura_template_prime/application")
      get action, params: { id: 1 } if action == :show
      get action if action != :show
    end

    it "sets the rendered_template" do
      allow(view_strategy).to receive(:template_for).with(action).and_return("bravura_template_prime/#{action}")
      get action, params: { id: 1 } if action == :show
      get action if action != :show
      expect(assigns(:rendered_template)).to eq("bravura_template_prime/#{action}")
    end

    it "sets the rendered_layout" do
      allow(view_strategy).to receive(:layout).and_return("bravura_template_prime/application")
      get action, params: { id: 1 } if action == :show
      get action if action != :show
      expect(assigns(:rendered_layout)).to eq("bravura_template_prime/application")
    end
  end

  describe "GET #index" do
    it_behaves_like "a blog action", :index

    it "sets the general_blog_hero_title" do
      get :index
      expect(assigns(:general_blog_hero_title)).to eq("Test Title")
    end
  end

  describe "GET #show" do
    it_behaves_like "a blog action", :show
  end

  describe "GET #featured" do
    it_behaves_like "a blog action", :featured
  end

  describe "GET #archives" do
    it_behaves_like "a blog action", :archives
  end
end
