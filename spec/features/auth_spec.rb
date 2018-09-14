require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit("/users/new")
    expect(page).to have_content('Sign Up')
  end
end

feature 'signing up a user' do
  # background :each do
  #   visit new_user_path
  # end

  scenario 'shows username on the homepage after signup' do
    visit("/users/new")
    fill_in "Username", with: "not_chris"
    fill_in "Password", with: "startrek"
    click_on("Sign Up!")

    # save_and_open_page
    expect(page).to have_content('not_chris')

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'


end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
