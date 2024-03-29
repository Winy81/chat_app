require "rails_helper"

RSpec.feature "Messages creation" do

  before do
  	
    @john = User.create(username:"John", email:"john@test.com", password:"password")
    @jane = User.create(username:"Jane", email:"jane@test.com", password:"password")
    @first_room = Room.create(name: "First Room")
    @john.accesses.create(room_id:@first_room.id)
    @jane.accesses.create(room_id:@first_room.id)

    @first_message = RoomMessage.create(room_id: @first_room.id, user_id: @john.id, message: "Test message from John")
    @second_message = RoomMessage.create(room_id: @first_room.id, user_id: @jane.id, message: "Test message from Jane")
  
    login_as(@john)
  
  end

  scenario "create a new message" do

  	visit "/"

  	expect(page).to have_content(@first_room.name)

  	click_link(@first_room.name)

  	expect(page).to have_content("#{@first_message.message} - #{@john.username}")
  	expect(page).to have_content("#{@second_message.message} - #{@jane.username}")

  	fill_in('input_message', :with => 'Third message')

  	click_button("Send")

  	expect(page).to have_content("Third message - #{@john.username}")

  end

end