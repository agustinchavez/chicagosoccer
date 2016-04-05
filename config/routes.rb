Rails.application.routes.draw do
  root 'pichess#index'
  resources :pitches, only: [:index]
end
