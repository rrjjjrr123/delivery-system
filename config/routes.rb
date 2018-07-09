Rails.application.routes.draw do
  
  devise_for :users,controllers: {registrations: "registrations"}
  root 'users#index'
  resources :admins 
  resources :customers ,:shopkeepers 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope'admin' do
    resources :users do
      collection do  
        post 'confirm_order'
        post 'update_user'
      end
    resources :orders    
    end    
  end  
end
