require "rails_helper"

RSpec.feature "Listing Rooms" do

  before do
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  
  login_as(@john)

  end

  scenario "no rooms" do

  	visit "/"

  	expect(page).to have_content(@john.username)
  	expect(page).to have_content(@john.id)

  end

end