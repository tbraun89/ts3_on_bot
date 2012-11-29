TS3OnBot::Application.routes.draw do

  devise_for :users

  root :to => 'overview#index'

  resources :users, :except => :show

  resources :bots, :except => :index

  post   "bots/:tab_name/change_tab"             => "bots#set_tab"
  post   "bots/:id/add_user"                     => "bots#add_user",          :as => "add_user"
  delete "bots/:id/remove_user/:uid"             => "bots#remove_user",       :as => "remove_user"
  get    "bots/:id/stop"                         => "bots#stop",              :as => "stop_bot"
  get    "bots/:id/start"                        => "bots#start",             :as => "start_bot"
  get    "bots/:id/restart"                      => "bots#restart",           :as => "restart_bot"
  get    "bots/:id/activate_module/:module_id"   => "bots#activate_module",   :as => "activate_bot_module"
  get    "bots/:id/deactivate_module/:module_id" => "bots#deactivate_module", :as => "deactivate_bot_module"

  namespace :bots do
    post ":id/save_afk_channel" => "afk_check_module#save", :as => "save_afk_channel"
  end

end
