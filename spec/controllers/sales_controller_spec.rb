require 'rails_helper'

RSpec.describe SalesController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end
end
