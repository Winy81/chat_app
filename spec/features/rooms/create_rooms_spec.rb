require "rails_helper"

RSpec.features "Rooms creation" do

  before do
  	
  	@john = User.create!(first_name: "John", last_name: "Doe",email: "john@example.com", password: "password")
  	@first_room = Room.create(name: "First Room")

  	login_as(@john)

  end
	
  scenario "Create room successfully" do



  end

end
