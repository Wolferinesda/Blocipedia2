Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wikis

  devise_for :users, controllers: { confirmations: 'confirmations' }

  get 'welcome/about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'

  get 'welcome/index'

end
