Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wikis

  get 'welcome/index'
  root 'welcome#index'
  get 'welcome/about'
  devise_for :users, controllers: { confirmations: 'confirmations' }

end
