Rails.application.routes.draw do
  resources :comments
 
  
  root 'pages#index'

  devise_for :users, at: 'users', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
  }
  
   resources :work_places do
    resources :comments, only:[:index,:new, :create]
  end
  get 'workplaces/find'
  post 'workplaces/find'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
