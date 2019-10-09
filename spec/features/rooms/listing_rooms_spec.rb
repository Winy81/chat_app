require "rails_helper"

RSpec.feature "Listing Rooms" do

  before do
  	@john = User.create(username:"John", email:"john@test.com", password:"password")
  end

end