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
    expect(find_link('Logout'))
    expect(page).to have_content("No Room")

  end

  scenario "loggout" do

  	john = User.create(username:"John", email:"john@test.com", password:"password")
    first_room = Room.create(name: "First Room")
    login_as(john)

    visit "/"

  	expect(find_link('Logout'))
  	click_link('Logout')

  	expect(page).to have_content("Log in")
  	expect(find_field('user_email'))
  	expect(find_field('user_password'))
  	expect(find_button('Log in'))
  	expect(find_link('Sign up').visible?)
  	expect(find_link('Forgot your password?').visible?)
  	expect(page).to have_content("You need to sign in or sign up before continuing.")

  	expect(page).to_not have_field(:id => "room_name")
  	expect(page).to_not have_content(first_room.name)
  	expect(page).to_not have_content(john.username)
    expect(page).to_not have_content("Logout")

  end

end