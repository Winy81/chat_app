require "rails_helper"

RSpec.feature "Index page" do

  scenario "no one logged in" do

  	visit "/"

  	expect(page).to have_content("Log in")
  	expect(find_field('user_email'))
  	expect(find_field('user_password'))
  	expect(find_button('Log in'))
  	expect(find_link('Sign up').visible?)
  	expect(find_link('Forgot your password?').visible?)

  end

end