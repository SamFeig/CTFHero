Rails.application.routes.draw do

  resources :users, only: %i[show]

  resources :searches, only: %i[index, show]
  
  root 'searches#index'
end
