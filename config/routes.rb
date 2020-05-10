Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end

  root to: "posts#index"
  resources :tags do
    resources :posts do
      resources :comments 
    end
  end
  resources :users
  resources :articles
end
