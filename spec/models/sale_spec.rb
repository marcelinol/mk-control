require 'rails_helper'

RSpec.describe Sale, :type => :model do
  context 'validations' do
    let(:sale) { Sale.new(customer: nil) }

    it { expect(sale).not_to be_valid }
  end
end
