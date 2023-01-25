class AccessesController < ApplicationController

  def invite
    @room = Room.find_by_id(access_params[:room_id])
    checked_permission_for_update = @room.accesses.where(user_id:current_user.id)
    if checked_permission_for_update.empty?
      flash[:alert] = "You are not authorized add permission for this room"
      redirect_to rooms_path
    else
      new_access = @room.accesses.new(user_id:access_params[:invited_user_id])
      if new_access.save
        flash[:notice] = "Permission been added for #{new_access.user.username}"
        redirect_to room_path(@room.id)
      else
        flash[:alert] = "Permission couldn't been saved"
        redirect_to rooms_path
      end
    end
  end

  def uninvite
    redirect_to rooms_path
  end

  def access_params
    params.require(:access_params).permit(:invited_user_id,
                                          :room_id)
  end

end