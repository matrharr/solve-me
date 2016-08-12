Rails.application.routes.draw do
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'

  get 'users/:access_token/edit' => 'users#edit'

  resources :users, param: :access_token
  resources :questionaires
  resources :matches, only: [:index, :delete]

end
