Rails.application.routes.draw do  
  resources :products  do 
    collection do 
      get 'get_codes'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users
  root 'users#index'
end
