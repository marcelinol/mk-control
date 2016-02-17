require 'rails_helper'

RSpec.describe Customer, :type => :model do
  context 'validations' do
    let(:customer) { Customer.new(name: nil, source: nil) }

    it { expect(customer).not_to be_valid }

    it 'has two errors' do
      customer.valid?
      expect(customer.errors.count).to eq(2)
    end
  end

  context 'callbacks' do
    let!(:first_consultant) { create(:consultant, id: 1) }
    let(:customer)   { create(:customer) }

    it 'assigns the first consultant (while devise is still off)' do
      expect(customer.consultant_id).to eq 1
    end
  end
end
