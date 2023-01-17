require 'spec_helper'
require 'rails_helper'

describe RoomMessage, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :message }

    it { is_expected.to validate_length_of(:message).is_at_least(0) }
    it { is_expected.to validate_length_of(:message).is_at_most(10000) }

  end
end