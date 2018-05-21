require 'rails_helper'

feature 'Can view individual posts' do
  let (:user) { create(:user) }

  before(:each) do
    create_user_and_log_in
  end
  scenario 'Can click and view a single post' do
    post = create(:post, user: user)

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end