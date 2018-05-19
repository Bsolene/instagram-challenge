require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  describe "POST #create" do
    let (:user) { create(:user, email: "bob@gmail.com", password: "mypassword", password_confirmation: "mypassword") }

    it "creates a new Comment" do
      expect{ create(:comment, user: user) }.to change(Comment,:count).by(1)
    end
  end
end
