Rails.application.routes.draw do
  resources :stories, only: [:index, :new, :create]
  root 'stories#index'
end
