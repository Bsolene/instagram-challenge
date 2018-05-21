require 'rails_helper'

feature 'Index displays a list of posts' do
  let (:user) { create(:user) }

  before(:each) do
    create_user_and_log_in
  end
  scenario 'the index displays correct created post information' do
    post_one = create(:post, user: user, caption: "This is post one")
    post_two = create(:post, user: user, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
  end
end