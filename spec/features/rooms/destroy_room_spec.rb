require "rails_helper"

RSpec.feature "Destroy room" do

  before do
  	
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  	@first_room = Room.create(name: "First Room")
  	@second_room = Room.create(name: "Second Room")

  	login_as(@john)

  end

  scenario "Delete room successfully" do

  	rooms = Room.all.count

  	visit "/"

  	expect(page).to have_content(@first_room.name)
  	expect(page).to have_content(@second_room.name)
  	expect(rooms).to eq(2)

  	click_link(@first_room.name)

  	expect(page).to have_content("Close the room")
  	click_link("Close the room")

  	rooms = Room.all.count

  	expect(page).to have_content(@second_room.name)
  	expect(page).to_not have_content(@first_room.name)
  	expect(page).to have_content("Room has been closed")
  	expect(rooms).to eq(1)

  end

end