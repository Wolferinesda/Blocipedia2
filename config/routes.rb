Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  get 'welcome/about', to: 'static_pages#welcome/about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :wikis

  root 'welcome#index'
end
