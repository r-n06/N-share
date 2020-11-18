Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post "/likes/:post_id", to: "likes#like", as: 'like'
  delete "/likes/:post_id", to: "likes#unlike", as: 'unlike'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
