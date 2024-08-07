# spec/dummy/config/routes.rb
Rails.application.routes.draw do
  mount BravuraTemplatePrime::Engine => "/bravura_template_prime"
  get 'blog', to: 'blog#index'
  get 'blog/:id', to: 'blog#show'
  get 'blog/featured', to: 'blog#featured'
  get 'blog/archives', to: 'blog#archives'
end
