Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
