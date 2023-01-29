class RoomsController < ApplicationController

	def index
		@rooms = Room.all
		@room = Room.new
	end

	def create
		if Access.under_created_room_limit_by_user?(current_user)
			@room = Room.new(room_params)
			if @room.save
				if is_the_room_secured?
					@access = @room.accesses.new(user_id:current_user.id)
					if @access.save
						redirection_for_rooms_path_with_flash(:notice, "Room has been created with name: #{@room.name}")
					else
						@room.delete
						redirection_for_rooms_path_with_flash(:alert, "Room hasn't been created")
					end
				else
					redirection_for_rooms_path_with_flash(:notice, "Room has been created with name: #{@room.name}")
				end
			else
				redirection_for_rooms_path_with_flash(:alert, "Room hasn't been created")
			end
		else
			redirection_for_rooms_path_with_flash(:alert, "Room hasn't been created, you are joined for to much rooms")
		end
	end

	def destroy
		@room = Room.find(params[:id])
		if @room.destroy
			redirection_for_rooms_path_with_flash(:alert, "#{@room.name}'s room has been closed")
		else
			flash[:alert] = "Room has not been closed"
			redirect_to room_path(@room)
		end

	end

	private

	def room_params
		params.require(:room).permit(:name,
																 :security)
	end

	def is_the_room_secured?
		room_params['security'].to_i == 1
	end

end
