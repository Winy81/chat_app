require 'spec_helper'
require 'rails_helper'

describe Access, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :user_id }

  end

  describe 'under_created_room_limit_by_user?' do

    before do
      @user = User.create(username:'Test', email:'test@test.com', password:'password', role:'admin')
      @user.accesses.create(room_id:1)
      @user.accesses.create(room_id:1)
    end

    it 'should provede access for the user if he has access for number of rooms under limit' do

      expect(Access.under_created_room_limit_by_user?(@user)).to eq(true)

    end

  end
end