Rails.application.routes.draw do
  get "profile/show"
  resources :products do
    resource :vote, only: [:create, :destroy]
    resource :hunter, only: [:create, :destroy]
    # post "comments", to: "comments#create"
    resources :comments
  end
  resources :profile
  devise_for :users
  root "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
