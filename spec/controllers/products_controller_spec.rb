require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    xit "returns http success" do
      get :edit
      expect(response).to be_success
    end
  end

end
