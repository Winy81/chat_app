class AccessesController < ApplicationController

  def invite
    @room = Room.find_by_id(access_params[:room_id])
    checked_permission_for_update = @room.accesses.where(user_id:current_user.id)
    if checked_permission_for_update.empty?
      redirection_for_rooms_path_with_flash(:alert, "You are not authorized add permission for this room")
    else
      new_access = @room.accesses.new(user_id:access_params[:invited_user_id])
      if new_access.save
        flash[:notice] = "Permission been added for #{new_access.user.username}"
        redirect_to room_path(@room.id)
      else
        redirection_for_rooms_path_with_flash(:alert, "Permission couldn't been saved")
      end
    end
  end

  def uninvite
    redirection_for_rooms_path_with_flash(:alert, "User access has been removed from this room")
  end

  def access_params
    params.require(:access_params).permit(:invited_user_id,
                                          :room_id)
  end

end