require 'spec_helper'
require 'rails_helper'

describe Room, type: :model do

  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_length_of(:name).is_at_most(30) }

end