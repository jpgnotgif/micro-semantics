Rails.application.routes.draw do
  resources :search_terms
  root 'search_terms#new'
  resource :search_terms, only: :new
  resources :products, only: [:index, :show]
end
