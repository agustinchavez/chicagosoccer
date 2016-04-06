class PitchesController < ApplicationController

    include ParserHelper

    PITCHES ||= ParserHelper.get_data

  def index
    @pitches = Pitch.all
    render "/pitches/index"
  end

  def user_latitude_longitude
    @user_location = Geokit::LatLng.new(params[:lat].to_f, params[:lng].to_f)
    @pitch = Pitch.closest(:origin => @user_location).first
    binding.pry
  end

  def coordinate_conversion
    pitch_address = params["address"] + ", " + params["city"] + ", " + params["zip"]
    address_data = Geokit::Geocoders::GoogleGeocoder.geocode pitch_address
    @user_location = Geokit::LatLng.new(address_data.lat, address_data.lng)
    @pitch = Pitch.closest(:origin => @user_location).first
    render "/pitches/user_latitude_longitude"
  end

end
