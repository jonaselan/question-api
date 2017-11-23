Rails.application.routes.draw do
  root 'welcome#index'
  resources :questions, only: [:index]
  resources :dashboard, only: [:index]
end
