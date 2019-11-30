Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, at: 'users', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
  }
  
  resources :work_places
  #   resources :comments, only:[:index,:new, :create]
  # end
  get 'workplaces/find'
  post 'workplaces/find'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
