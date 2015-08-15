Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about-us',    to: 'static_pages#about_us'
  get '/help-center', to: 'static_pages#help_center'

  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'

  get    '/sign-up',       to: 'users#new'

  resources :users, only: [:create, :update, :edit, :destroy] do
    resources :boards do
      resources :lists, only: [:new, :create, :edit, :update, :destroy] do
        resources :cards, only: [:create, :edit, :update, :destroy]
      end
    end
  end
end
