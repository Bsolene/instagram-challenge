require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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
    it "creates a new Item" do
      expect{ create(:post) }.to change(Post,:count).by(1)
    end
  end
  
  let(:post) { create(:post) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: post }
      expect(response).to have_http_status(:success)
    end
    it "renders the show template" do
      get :show, params: { id: post }
      expect(response).to render_template("show")
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: post }
      expect(response).to have_http_status(:success)
    end
    it 'renders the edit template' do
      get :edit, params: { id: post }
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
end
