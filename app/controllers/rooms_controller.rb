class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def create
  	@room =Room.new(room_params)
  	if @room.save
  	  flash[:success] = "Room has been created with name: #{@room.name}"
  	  redirect_to rooms_path
  	else
  	  flash[:alert] = "Room hasn't been created"
  	  redirect_to rooms_path
  	end
  end

  def show
  	@room = Room.find(params[:id])
  	@rooms = Room.all
  	@room_message = RoomMessage.all.where(room_id:@room)
  end

  def destroy
  	@room = Room.find(params[:id])
  	if @room.destroy
  	  flash[:alert] = "#{@room.name}'s room has been closed"
  	  redirect_to rooms_path
  	else
  	  flash[:alert] = "Room has not been closed"
  	  redirect_to rooms_path(@room)
  	end

  end

  private

  def room_params
  	params.require(:room).permit(:name)
  end

end
