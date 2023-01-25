class RoomMessagesController < ApplicationController

  def new
  	@rooms = Room.all
    @room = Room.find(params[:id])
  	@room_message = RoomMessage.message_filter(room_id:@room).order(created_at: :desc)
  	@current_room_id = @room.id
  	@creator_of_message = User.all
  	@new_room_message = RoomMessage.new
    @users = User.all
  end
  

  def create
    @new_room_message = RoomMessage.new(message_params)
    @current_room_id = @new_room_message.room_id
    @new_room_message.save
    redirect_to room_path(@current_room_id)
  end

  private

  def message_params
  	params.require(:room_message).permit(:message,:room_id,:user_id)
  end

end
