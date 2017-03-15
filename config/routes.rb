Rails.application.routes.draw do
  root 'search_terms#new'
  resource :search_terms, only: [:new, :create]
  resources :products, only: [:index, :show]
end
