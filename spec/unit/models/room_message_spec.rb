require 'spec_helper'
require 'rails_helper'

describe RoomMessage, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :message }

    it { is_expected.to validate_length_of(:message).is_at_least(0) }
    it { is_expected.to validate_length_of(:message).is_at_most(10000) }

  end

  describe 'message_filter' do

    before do
      @user = User.create(username:'Test', email:'test@test.com', password:'password', role:'admin')
      @room = Room.create(name:'Test_room')
      @message_1 = RoomMessage.create(room_id:@room.id, user_id:@user.id, message:'First message')
      @message_2 = RoomMessage.create(room_id:@room.id, user_id:@user.id, message:'Second message')
    end

    it 'should provede access for the user if he has access for number of rooms under limit' do

      expect(@room.room_messages.count).to eq(2)

    end

  end
end