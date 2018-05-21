require 'rails_helper.rb'

feature 'Creating posts' do

  before(:each) do
    create_user_and_log_in
  end

  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/snow.jpg')
    fill_in 'Caption', with: '#snow #love'
    click_button 'Create Post'
    expect(page).to have_content('#snow #love')
    expect(page).to have_css("img[src*='snow.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content("can't be blank")
  end
end
