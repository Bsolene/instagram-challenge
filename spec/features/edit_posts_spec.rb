require 'rails_helper'

feature 'Editing posts' do
  let (:user) { create(:user) }

  before(:each) do
    create_user_and_log_in
  end
  background do
    post = create(:post, user: user)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'edit_post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end
  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end