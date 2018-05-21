require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:max) { User.create(email: "max@test.com", username: "Max", password: "12345678", password_confirmation: "12345678") }

  before(:each) do
    sign_in max
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    it "creates a new Post" do
      expect{ create(:post, user: max) }.to change(Post,:count).by(1)
    end
  end

  let(:post) { create(:post, user: max) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: post, user: max }
      expect(response).to have_http_status(:success)
    end
    it "renders the show template" do
      get :show, params: { id: post, user: max }
      expect(response).to render_template("show")
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: post, user: max }
      expect(response).to have_http_status(:success)
    end
    it 'renders the edit template' do
      get :edit, params: { id: post, user: max }
      expect(response).to render_template('edit')
    end
  end

  describe "PATCH #update" do
    it "updates the post and redirects" do
      patch :update, params: { id: post , post: { caption: "Hello" } }
      post.reload
      expect(post.caption).to eq("Hello")
      expect(response).to be_redirect
    end
  end

  describe "DELETE #destroy" do
    it "deletes the post and redirects" do
      post = create(:post, user: max)
      expect{
        delete :destroy, params: { id: post, user: max }
      }.to change(Post, :count).by(-1)
      expect(response).to be_redirect
    end
  end
end
