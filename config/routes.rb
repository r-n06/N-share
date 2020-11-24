Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'tag_search'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    get :likes, on: :collection
  end
end
