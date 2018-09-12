Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'

  #get '/new', to: 'team_names#new'
  resources :team_names

end
