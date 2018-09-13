Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations', passwords: 'users/passwords' }

  root 'static_pages#home'
  get  '/about', to: 'static_pages#about'

  resources :team_names

end
