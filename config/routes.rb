Rails.application.routes.draw do
  root 'welcome#index' 
  resources :questions, only: [:index]
end
