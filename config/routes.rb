BravuraTemplatePrime::Engine.routes.draw do
  get '/' => 'blog#index', as: :blog_index
  get '/:id' => 'blog#show', as: :blog_post
end
