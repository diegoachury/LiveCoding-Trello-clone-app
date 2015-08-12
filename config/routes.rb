Rails.application.routes.draw do
  get '/about-us',    to: 'static_pages#about_us'
  get '/help-center', to: 'static_pages#help_center'

  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'

  get    '/sign-up',       to: 'users#new'

  resources :users, only: [:create, :update, :edit, :destroy]
  resources :boards
end
