require 'rails_helper'

RSpec.feature "Creating comments", type: :feature do
  before(:each) do
   post = create(:post)
  end

  scenario "Adding comments to a post" do
    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    fill_in 'Comment', with: 'Heeyyy :)'
    click_button 'Create Comment'
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content("Heeyyy :)")
  end
end