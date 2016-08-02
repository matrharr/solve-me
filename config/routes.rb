Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questionaires

  resources :users

  resources :matches, only: [:index, :delete]

end
