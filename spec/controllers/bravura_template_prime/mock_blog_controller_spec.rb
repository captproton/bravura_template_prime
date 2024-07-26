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
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("bravura_template_prime/blog/index")
    end

    it "assigns @posts" do
      get :index
      expect(assigns(:posts)).to be_an(Array)
    end
  end

  describe "GET #show" do
    let(:post_id) { "1" }

    it "responds successfully" do
      get :show, params: { id: post_id }
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: { id: post_id }
      expect(response).to render_template("bravura_template_prime/blog/show")
    end

    it "assigns @post" do
      get :show, params: { id: post_id }
      expect(assigns(:post)).to be_present
    end
  end

  # it_behaves_like "a blog controller"
end
