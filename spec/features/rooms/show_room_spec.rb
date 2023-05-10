require "rails_helper"

RSpec.feature "Rooms creation" do

  before do
  	
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  	@first_room = Room.create(name: "First Room")

  	login_as(@john)

  end

  scenario "Get into a room" do

  	visit "/"

  	expect(page).to have_content(@first_room.name)

  	click_link(@first_room.name)

  	expect(page).to have_content("You are in room: #{@first_room.name}")
  	expect(page).to have_content("Room's Id is: #{@first_room.id}")
  	expect(page).to_not have_field(:id => "room_name")
  	expect(page).to have_field(:id => "input_message")
  	expect(page).to have_content("Close the room")
  	expect(page).to have_content("Back for list of the rooms")

  end
end