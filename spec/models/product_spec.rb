require 'rails_helper'

RSpec.describe Product, :type => :model do
  context 'validations' do
    let(:product) { Product.create(consultant_id: nil, request_id: nil, name: nil) }

    it { expect(product.errors.count).to eq(3) }
  end

  context 'when product is assigned to a sale' do
    let(:consultant) { build(:consultant) }
    let(:product)    { create(:product, consultant: consultant) }
    let(:sale)       { create(:sale, consultant: consultant) }

    it 'is marked as sold' do
      sale.products << product

      expect(product).to be_sold
    end
  end
end
