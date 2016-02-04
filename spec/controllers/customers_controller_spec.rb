require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET schedule_contact' do
    before { get :schedule_contact }

    it { (expect(response).to be_success) }
  end

  describe 'POST update' do
    let!(:customer) { create(:customer, id: 1) }
    before { post :update, { id: 1, next_contact_date: 2.days.from_now.to_date } }

    it { (expect(response).to be_success) }
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

end
