require "rails_helper"

RSpec.feature "Destroy room" do

  before do
  	
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  	@first_room = Room.create(name: "First Room")
  	@second_room = Room.create(name: "Second Room")

  	login_as(@john)

  end

end