require 'spec_helper'
require 'rails_helper'

describe User, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :role }

    subject { User.new(username: 'test_user', email:'test_mail@email.com', password:'test_pass') }
    it { is_expected.to validate_uniqueness_of :username }

    it { is_expected.to validate_inclusion_of(:role).in_array(User::Role::ALL) }

  end
end