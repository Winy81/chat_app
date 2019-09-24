class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  private

  def room_params
  	params.require(:room).permit(:name)
  end

end
