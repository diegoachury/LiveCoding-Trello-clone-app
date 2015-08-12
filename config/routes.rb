Rails.application.routes.draw do
  get '/about-us',    to: 'static_pages#about_us'
  get '/help-center', to: 'static_pages#help_center'

  resources :boards
end
