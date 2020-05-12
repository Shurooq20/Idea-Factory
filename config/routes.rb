Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'ideas#index'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :ideas do 

    resources :likes, shallow: true, only: [:create, :destroy]

    resources :reviews, shallow: true, only: [:create, :destroy]

  end

end
