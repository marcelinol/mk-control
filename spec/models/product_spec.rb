require 'rails_helper'

RSpec.describe Product, :type => :model do
  context 'validations' do
    let(:product) { Product.create(consultant_id: nil, request_id: nil, name: nil) }

    it { expect(product.errors.count).to eq(3) }
  end
end
