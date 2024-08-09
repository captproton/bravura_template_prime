BravuraTemplatePrime::Engine.routes.draw do
  resources :blog, only: %i[index show]
end
