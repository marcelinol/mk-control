require 'rails_helper'

RSpec.describe Sale, :type => :model do
  context 'validations' do
    let(:sale) { Sale.new(customer: nil) }

    it { expect(sale).not_to be_valid }
  end

  context 'new sale' do
    let(:consultant) { build(:consultant) }
    let(:products)   { build_list(:product, 2, consultant: consultant) }
    let!(:sale)      { create(:sale).tap { |s| s.products << products } }

    it 'marks product as sold and calculate total' do
      expect(Product.sold).to include(products.first)
      expect(Product.sold).to include(products.last)
    end
  end

  context 'callbacks' do
    let(:consultant) { create(:consultant) }
    let(:sale)      { create(:sale_with_product, consultant: consultant) }

    it 'sets its value' do
      expect(sale.value).to be > 0
    end

    it 'updates consultant income' do
      expect(consultant.income).to eq 0

      expect(sale.value).to be
      expect(consultant.income).to be > 0
    end
  end
end
