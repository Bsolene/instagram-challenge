require 'rails_helper'

feature 'Deleting posts' do
  let (:user) { create(:user, email: "bob@gmail.com", password: "mypassword", password_confirmation: "mypassword") }

  before(:each) do
    create_user_and_log_in
  end
  background do
    post = create(:post, user_id: user, caption: 'Abs for days.')

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
  end
  scenario 'Can delete a single post' do
    click_link 'delete_post'

    expect(page).to have_content('Your post has been succesfully deleted')
    expect(page).to_not have_content('Abs for days.')
  end
end