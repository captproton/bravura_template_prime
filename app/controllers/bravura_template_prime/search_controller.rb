# app/controllers/bravura_template_prime/search_controller.rb
module BravuraTemplatePrime
  class SearchController < ApplicationController
    def index
      @results = perform_search(params[:query])
      respond_to do |format|
        format.turbo_stream
      end
    end

    private

    def perform_search(query)
      return [] if query.blank?

      Post.public_feed
          .published
          .where("title ILIKE ? OR body_copy ILIKE ?", "%#{query}%", "%#{query}%")
          .limit(10)
    end
  end
end
