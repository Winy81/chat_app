require "rails_helper"

RSpec.feature "Messages creation" do

    before do
  	
  	  @john = User.create(username:"John", email:"john@test.com", password:"password")
  	  @jane = User.create(username:"Jane", email:"jane@test.com", password:"password")
  	  @first_room = Room.create(name: "First Room")

  	  login_as(@john)

  end

end