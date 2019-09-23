class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  private

  def room_params
  	params.require(:room).permit(:name)
  end

end
