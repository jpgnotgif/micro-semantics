Rails.application.routes.draw do
  root 'search_terms#new'
  resources :search_terms, only: [:new, :create]
  resources :products, only: [:index, :show]
end
