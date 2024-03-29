Rails.application.routes.draw do  
  resources :quiz_attempts
  resources :quizzes do 
    member do 
      get 'attempt'
      get 'assign'
      post 'assignment'
    end
  end
  resources :groups
  resources :products  do 
    collection do 
      get 'get_codes'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    patch 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users
  root 'users#index'
end
