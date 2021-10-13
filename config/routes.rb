Rails.application.routes.draw do

  get 'posts/list' => 'posts#list'
  get 'posts/search' => 'posts#search'
  post 'posts/create' => 'posts#create'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit'=>'posts#edit',as:'posts_edit'
  patch 'posts/:id/update'=>'posts#update',as:'posts_update'
  delete 'posts/:id/destroy'=>'posts#destroy',as:'posts_destroy'
  get 'posts/:id' => 'posts#post'
  get '/' => 'home#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
