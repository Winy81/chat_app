require 'spec_helper'

describe User, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :role }

    it { is_expected.to validate_uniqueness_of :username }

    it { is_expected.to validate_inclusion_of(:role).in?(Role::ALL) }

  end
end