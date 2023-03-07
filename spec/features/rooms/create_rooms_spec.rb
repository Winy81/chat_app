require "rails_helper"

RSpec.feature "Rooms creation" do

  before do
  	
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  	@first_room = Room.create(name: "First Room")

  	login_as(@john)

  end
	
  scenario "Create room successfully" do

  	visit "/"

  	expect(page).to have_content(@first_room.name)

  	fill_in('room_name', :with => 'Second Room')
  	click_button('Create')

  	expect(page).to have_content(@first_room.name)
  	expect(page).to have_content('Room has been created with name: Second Room')
  	expect(page).to have_content("Second Room")

  end

  scenario "Create room unsuccessfully" do

  	rooms = Room.all.count

    name_of_room = ([*('a'..'z'),*('0'..'9')]).sample(32).join.to_s

  	visit "/"

  	expect(page).to have_content(@first_room.name)

  	fill_in('room_name', :with => name_of_room)
  	click_button('Create')

  	expect(page).to have_content(@first_room.name)
  	expect(page).to have_content("Room hasn't been created")
  	expect(rooms).to eq(1)	

  end

end
