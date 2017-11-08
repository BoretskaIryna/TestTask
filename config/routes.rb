Rails.application.routes.draw do

  resources :access_activation, only: [:edit]
  resources :members
  get 'members/destroy'

  resources :teams
  resources :tasks
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }
  root 'static_pages#home'

  devise_scope :user do
    get "/users/:id", to: "users/sessions#show", as: "user"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
