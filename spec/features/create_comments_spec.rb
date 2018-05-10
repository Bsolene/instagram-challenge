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
  it 'needs an text to create a comment' do
    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_button 'Create Comment'
    expect(page).to have_content("You need a text to comment here!")
  end
end