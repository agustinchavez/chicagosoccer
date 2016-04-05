Rails.application.routes.draw do
  root 'pitches#index'
  resources :pitches, only: [:index, :show]
    post 'pitches/user_latitude_longitude', :to => 'pitches#user_latitude_longitude'
end
