Rails.application.routes.draw do  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :skip => [:registrations]
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
