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
  	click_button('Save')

  	expect(page).to have_content(@first_room.name)
  	expect(page).to have_content('Second Room')

  end

  scenario "Create room unsuccessfully" do

  	visit "/"

  	expect(page).to have_content(@first_room.name)

  	fill_in('room_name', :with => '')
  	click_button('Save')

  	expect(page).to have_content(@first_room.name)
  	expect(page).to have_content("Room hasn't been created")
  	

  end

end