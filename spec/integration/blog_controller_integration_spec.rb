require 'rails_helper'

# Mock the BravuraTemplateBase::ControllerExtensions if it's not available
unless defined?(BravuraTemplateBase::ControllerExtensions)
  module BravuraTemplateBase
    module ControllerExtensions
      # Add any methods that your controller expects from this module
      def current_account
        # Mock implementation
      end

      def all_settings
        # Mock implementation
      end

      # Add other methods as needed
    end
  end
end

RSpec.describe BravuraTemplatePrime::BlogController, type: :controller do
  routes { BravuraTemplatePrime::Engine.routes }

  controller(BravuraTemplatePrime::BlogController) do
    include BravuraTemplateBase::ControllerExtensions
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns @posts" do
      # Assuming you have a way to create test posts
      posts = [double('Post'), double('Post')]
      allow(Post).to receive(:all).and_return(posts)

      get :index
      expect(assigns(:posts)).to eq(posts)
    end

    it "assigns @presenter" do
      get :index
      expect(assigns(:presenter)).to be_a(BravuraTemplatePrime::PresentationAdapter)
    end
  end

  # Add more tests for other actions as needed
end
