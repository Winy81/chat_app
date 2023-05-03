class RoomMessagesController < ApplicationController

  def new
    @room = Room.find(params[:id])
    @current_room_id = @room.id

    if access_for_the_current_room?
      @rooms = Room.all
      @room_message = RoomMessage.message_filter(@room.id).order(created_at: :desc)
      @creator_of_message = User.all
      @new_room_message = RoomMessage.new
      @users = User.all
    else
      redirection_for_rooms_path_with_flash(:alert, "You have no access for this room")
    end
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

  def access_for_the_current_room?
    Access.where(room_id:@current_room_id,user_id:current_user.id).empty? && @room.security == true ? false : true
  end

end
