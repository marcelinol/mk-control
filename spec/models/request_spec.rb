require 'rails_helper'

RSpec.describe Request do

  def fixture(name)
    File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', name))
  end

  context 'validations' do
    let(:request) { Request.new(consultant_id: nil) }

    it { expect(request).not_to be_valid }
  end

  context 'importing' do
    let(:consultant) { create(:consultant, name: 'testing') }
    let(:request)    { create(:request, consultant: consultant) }
    let(:purchase_price) { 37.00 * 0.65 }
    let(:product_attributes) do
      {
        'consultant_id'  => consultant.id,
        'request_id'     => request.id,
        'code'           => 10081938,
        'name'           => 'Trio de Sombras Out of the Blue',
        'sales_price'    => BigDecimal.new('37'),
        'purchase_price' => BigDecimal.new(purchase_price.to_s),
        'points'         => 15,
        'status'         => 0,
        'sale_id'        => nil
      }
    end

    let(:first_product) do
      Product.first.attributes.except('id', 'created_at', 'updated_at', 'purchase_price_currency', 'sales_price_currency', 'product_type')
    end

    let(:filename) { 'pedido2-marykay.csv' }
    let(:file_path) { fixture(filename) }

    it 'creates first product' do
      request.import_list(file_path)

      expect(first_product).to eq(product_attributes)
      expect(Product.count).to eq(19)
      expect(Product.in_stock.count).to eq(15)
      expect(Product.to_be_defined.count).to eq(4)
    end
  end

  context 'callbacks' do
    let(:consultant) { create(:consultant) }
    let(:request)    { create(:request, consultant: consultant) }
    let(:filename)   { 'pedido2-marykay.csv' }
    let(:file_path)  { fixture(filename) }

    it "updates consultant's balance" do
      expect(consultant.balance.to_i).to eq 0

      request.import_list(file_path)

      expect(consultant.balance.to_i).to be < 0
    end
  end

end
