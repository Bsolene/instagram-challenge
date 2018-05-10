require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    it "creates a new Comment" do
      expect{ create(:comment) }.to change(Comment,:count).by(1)
    end
  end
end
