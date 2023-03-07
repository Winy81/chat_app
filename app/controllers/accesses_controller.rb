class AccessesController < ApplicationController

  def invite
    @room = Room.find_by_id(access_params[:room_id])
    checked_permission_for_update = @room.accesses.where(user_id:current_user.id)
    if checked_permission_for_update.empty?
      redirection_for_rooms_path_with_flash(:alert, "You are not authorized add permission for this room")
    else
      new_access = @room.accesses.new(user_id:access_params[:access_for_user_id])
      if new_access.save
        flash[:notice] = "Permission been added for #{new_access.user.username}"
        redirect_to room_path(@room.id)
      else
        redirection_for_rooms_path_with_flash(:alert, "Permission couldn't been saved")
      end
    end
  end

  def uninvite
    access = Access.find_by(user_id:access_params[:access_for_user_id], room_id:access_params[:room_id])
    if access.present?
      if access.delete
        flash[:alert] = "#{access.user.username}'s access has been removed from this room"
        redirect_to room_path(access_params[:room_id])
      else
        flash[:alert] = "Permission has not been deleted for #{access.user.username}"
        redirect_to room_path(access_params[:room_id])
      end
    else
      flash[:alert] = "Looks like permission already removed for #{access.user.username}"
      redirect_to room_path(access_params[:room_id])
    end
  end


  def access_params
    params.require(:access_params).permit(:access_for_user_id,
                                          :room_id)
  end

end