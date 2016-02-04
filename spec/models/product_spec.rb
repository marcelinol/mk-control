require 'rails_helper'

RSpec.describe Product, :type => :model do
  context 'validations' do
    let(:product) { Product.create(consultant_id: nil, request_id: nil, name: nil) }

    it { expect(product.errors.count).to eq(3) }
  end

  context 'when product is assigned to a sale' do
    let(:product) { create(:product) }
    let(:sale)    { create(:sale) }

    it 'is marked as sold' do
      sale.products << product

      expect(product).to be_sold
    end
  end
end
