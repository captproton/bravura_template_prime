# spec/integration/blog_controller_integration_spec.rb
require 'rails_helper'
require_relative '../support/mock_blog_controller'
require_relative '../support/shared_examples_for_blog_controller'

RSpec.describe BravuraTemplatePrime::MockBlogController, type: :controller do
  routes { BravuraTemplatePrime::Engine.routes }

  controller(BravuraTemplatePrime::MockBlogController) do
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template('bravura_template_prime/blog/index')
    end

    it "assigns a presenter" do
      get :index
      expect(assigns(:presenter)).to be_a(BravuraTemplatePrime::PresentationAdapter)
    end

    it "includes prime-specific data" do
      get :index
      expect(assigns(:prime_specific_data)).to eq("This is added by BravuraTemplatePrime")
    end

    # Add more tests for your engine-specific behavior

    it_behaves_like "a blog controller"
  end
end
