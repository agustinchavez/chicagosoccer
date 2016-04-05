class PitchesController < ApplicationController

    include ParserHelper

  def index
    @pitches = Pitch.all
    render "/pitches/index"
  end
end
