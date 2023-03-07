module Modules
  module RedirectionSupport

    def redirection_for_rooms_path_with_flash(type, message)
      flash[type] = message
      redirect_to rooms_path
    end

    def redirection_to_a_room(room_id, type = nil, message = nil)
      flash[type] = message unless type.nil? || message.nil? 
      redirect_to room_path(room_id)
    end

  end
end