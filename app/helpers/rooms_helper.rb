module RoomsHelper

  def is_user_inviteable?(user,current_room)
    current_room.accesses.where(user_id:user.id).empty? ? true : false
  end

end