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
  end
end
