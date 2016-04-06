Rails.application.routes.draw do

  root 'pitches#index'

  resources :pitches, only: [:index, :show]
    post 'pitches/user_latitude_longitude', :to => 'pitches#user_latitude_longitude'
    post 'pitches/driving_directions', :to => 'pitches#driving_directions'
    post 'pitches/street_view', :to => 'pitches#street_view'
    post 'pitches/coordinate_conversion', :to => 'pitches#coordinate_conversion'

end
