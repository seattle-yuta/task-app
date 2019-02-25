Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'projects#index'
  get '/project', to: 'projects#index'
  get     'sign_up', to: 'users#new'
  post    'sign_up', to: 'users#create'
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  get     'logout',  to: 'sessions#destroy'

  namespace :api, format: 'json' do
    resources :projects, only: [:index, :create, :update]
  end

end
