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

    scenario "logging in" do

  	visit "/"

  	john = User.create(username:"John", email:"john@test.com", password:"password")

  	fill_in('user_email', :with => 'john@test.com')
    fill_in('user_password', :with => 'password')

    click_button('Log in')

    expect(page).to have_content(john.username)
    expect(page).to have_content(john.id)
    expect(find_link('Logout'))
    expect(page).to have_content("No Room")


  end

end