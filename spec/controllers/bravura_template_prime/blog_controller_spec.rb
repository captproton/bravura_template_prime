# spec/controllers/bravura_template_prime/mock_blog_controller_spec.rb
require 'rails_helper'
require_relative '../../support/shared_examples_for_blog_controller'
require_relative '../../support/controllers/bravura_template_prime/mock_blog_controller'

RSpec.describe BravuraTemplatePrime::MockBlogController, type: :controller do
  routes { BravuraTemplatePrime::Engine.routes }

  before do
    BravuraTemplatePrime::Engine.routes.draw do
      get '/' => 'mock_blog#index', as: :blog_index
      get '/:id' => 'mock_blog#show', as: :blog_post
    end
  end

  describe "GET #index" do
    before { get :index }

    it "responds successfully" do
      expect(response).to be_successful
    end

    it "assigns a presenter" do
      expect(assigns(:presenter)).to be_a(BravuraTemplatePrime::PresentationAdapter)
    end

    it "includes prime-specific data" do
      expect(assigns(:prime_specific_data)).to eq("This is added by BravuraTemplatePrime")
    end
  end

  describe "GET #show" do
    let(:post_id) { "1" }
    before { get :show, params: { id: post_id } }

    it "responds successfully" do
      expect(response).to be_successful
    end

    it "assigns a presenter" do
      expect(assigns(:presenter)).to be_a(BravuraTemplatePrime::PresentationAdapter)
    end

    it "assigns a post" do
      expect(assigns(:post)).to be_present
    end
  end

  it_behaves_like "a blog controller"
end
