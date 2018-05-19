require 'rails_helper'


feature "Creating comments" do
  let (:user) { create(:user, email: "bob@gmail.com", password: "mypassword", password_confirmation: "mypassword") }
  before(:each) do
    create_user_and_log_in
  end
  background do
    post = create(:post, user_id: user, caption: 'Abs for days.')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
  end
  scenario "Adding comments to a post" do
    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    fill_in 'comment_comment', with: 'Heeyyy :)'
    click_button 'Publish'
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content("Heeyyy :)")
  end
  # it 'needs an text to create a comment' do
  #   visit '/'

  #   find(:xpath, "//a[contains(@href,'posts/1')]").click
  #   click_button 'Publish'
  #   expect(page).to have_content("You need a text to comment here!")
  # end
end