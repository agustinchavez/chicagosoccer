class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
    render "/pitches/index"
  end

  def user_latitude_longitude
    @user_location = Geokit::LatLng.new(params[:lat].to_f, params[:lng].to_f)
    @pitch = Pitch.closest(:origin => @user_location).first
    render "/pitches/user_latitude_longitude", layout: false
  end

  def driving_directions
    @user_location = Geokit::LatLng.new(params[:lat].to_f, params[:lng].to_f)
    @pitch = Pitch.find(params[:pitch])
    render "/pitches/driving_directions", layout: false
  end

   def street_view
    @user_location = Geokit::LatLng.new(params[:lat].to_f, params[:lng].to_f)
    @pitch = Pitch.find(params[:pitch])
    render "/pitches/street_view", layout: false
  end


  def coordinate_conversion
    pitch_address = params["address"] + ", " + params["city"] + ", " + params["zip"]
    address_data = Geokit::Geocoders::GoogleGeocoder.geocode pitch_address
    @user_location = Geokit::LatLng.new(address_data.lat, address_data.lng)
    @pitch = Pitch.closest(:origin => @user_location).first
    render "/pitches/user_latitude_longitude"
  end

end
