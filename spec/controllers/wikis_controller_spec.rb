require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

  before do
    @user = User.new(email: "fake@fake.com", password: "helloworld")
    @user.skip_confirmation!
    @user.save
    @my_wiki  = Wiki.new(title: "Test Title", body: "This is a fake test body for the Wiki", private: false, user: @user)
    @my_wiki.save
  end

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: @user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: @my_wiki.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: @my_wiki.id}
      expect(response).to have_http_status(:success)
    end
  end

end
