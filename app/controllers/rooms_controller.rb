class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  def create
  	@room =Room.new(room_params)
  	if @room.save
  	  flash[:success] = "Room has been created with name #{@room.name}"
  	  redirect_to rooms_path
  	else
  	  flash[:alert] = "Room hasn't been created"
  	  render :new
  	end
  end

  private

  def room_params
  	params.require(:room).permit(:name)
  end

end
