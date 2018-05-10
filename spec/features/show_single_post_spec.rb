require 'rails_helper'

feature 'Can view individual posts' do
  before(:each) do
    create_user_and_log_in
  end
  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end