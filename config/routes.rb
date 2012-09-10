TS3OnBot::Application.routes.draw do

  devise_for :users

  root :to => 'overview#index'

  resources :users, :except => :show

end
