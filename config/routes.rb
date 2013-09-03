PmsConnectEngine::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api,defaults:{format:'json'} do
    namespace :v1 do
      resources :pms_connect_engine
      match 'checkin' => 'pms_connect_engine#checkin'
      match 'checkout/:data' => 'pms_connect_engine#checkout'
      match 'login' => 'pms_connect_engine#login'
    end
  end

  resources :pms_connect_engine

end
