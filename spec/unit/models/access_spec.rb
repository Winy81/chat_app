require 'spec_helper'
require 'rails_helper'

describe Access, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :user_id }

  end
end