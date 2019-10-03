class RoomMessagesController < ApplicationController

  def new
  	@room = Room.find(params[:id])
  	@room_message = RoomMessage.all
  	@new_room_message = RoomMessage.new
  end
  

  def create
    @room_message = RoomMessage.create(message_params)
    redirect_to rooms_path                                   
  end

  private

  def message_params
  	params.require(:room_message).permit(:message,:room_id,:user_id)
  end
end
