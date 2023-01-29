module Modules
  module RedirectionSupport

    def redirection_for_rooms_path_with_flash(type,message)
      flash[type] = message
      redirect_to rooms_path
    end

  end
end