require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:max) { User.create(email: "max@test.com", password: "12345678", password_confirmation: "12345678") }
  let(:solene) { User.create(email: "solene@test.com", password: "12345678", password_confirmation: "12345678") }
  let(:post) { create(:post, user: max) }

  describe "POST #create" do
    it "creates a new Comment" do
      expect{ create(:comment, user: solene, post: post) }.to change(Comment,:count).by(1)
    end
  end
end
