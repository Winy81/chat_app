require "rails_helper"

RSpec.feature "Listing Rooms" do

  before do
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  
  login_as(@john)

  end

  scenario "no rooms" do

  	visit "/"

  	expect(page).to have_content("No Room")

  end

    scenario "available rooms" do

    room1 = Room.create(name: "Test_Room")
    room2 = Room.create(name: "Test_Room_2")

  	visit "/"

  	expect(page).to have_content(@john.username)
  	expect(page).to have_content(@john.id)
  	expect(page).to have_content(room1.name)
  	expect(page).to have_content(room2.name)

  end

end