Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'projects#index'
  get '/projects', to: 'projects#index'
  get '/board_lists/:project_id', to: 'projects#index'
  get '/cards', to: 'cards#index'
  get     'sign_up', to: 'users#new'
  post    'sign_up', to: 'users#create'
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  get     'logout',  to: 'sessions#destroy'

  namespace :api, format: 'json' do
    resources :projects, only: [:index, :create, :update]
    get '/board_lists/:project_id', to: 'board_lists#index'
    resources :board_lists, only: [:create, :update]
    resources :cards, only: [:index, :create, :update]
  end

end
