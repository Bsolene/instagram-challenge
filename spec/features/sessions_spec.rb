require 'rails_helper'

RSpec.feature "Sessions" do
  scenario "displays the user's email after successful login" do
    user = create(:user)
    visit new_user_session_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully")
  end
end