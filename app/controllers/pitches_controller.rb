class PitchesController < ApplicationController

    include ParserHelper

  def index
    @pitches ||= ParserHelper.get_data
    render "/pitches/index"
  end
end
