require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET schedule_contact' do
    let(:customer) { create(:customer) }

    before { get :schedule_contact, params: customer }

    it { (expect(response).to be_success) }
  end

  describe 'POST update' do
    let!(:customer) { create(:customer, id: 1) }
    before { post :update, { customer: { id: 1, next_contact_date: 2.days.from_now.to_date } } }

    it { (expect(response).to be_success) }
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

end
