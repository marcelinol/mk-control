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
end
