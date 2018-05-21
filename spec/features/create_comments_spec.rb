require 'rails_helper'

feature "Creating comments" do
  let(:solene) { User.create(email: "solene@test.com", password: "12345678", password_confirmation: "12345678") }
  let(:max) { User.create(email: "max@test.com", password: "12345678", password_confirmation: "12345678") }

  before do
    post = create(:post, user: solene, caption: 'Abs for days.')
  end

  background do
    login_as(max, :scope => :user)
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