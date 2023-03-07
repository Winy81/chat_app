module AccessesHelper

  def access_params_builder(user, current_room_id)
    {'access_params' => {:access_for_user_id => user.id, :room_id => current_room_id}}
  end

end