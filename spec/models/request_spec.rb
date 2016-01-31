require 'rails_helper'

RSpec.describe Request, :type => :model do

  def fixture(name)
    File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', filename))
  end

  context 'validations' do
    let(:request) { Request.new(consultant_id: nil) }

    it { expect(request).not_to be_valid }
  end

  context 'importing' do
    let(:consultant) { Consultant.create(name: 'testing') }
    let(:request)    { Request.new(consultant: consultant) }
    let(:purchase_price) { 37.00 * 0.65 }
    let(:product_attributes)    do
      {
        "consultant_id" => consultant.id,
        "request_id" => request.id,
        "code" => 10081938,
        "name" => 'Trio de Sombras Out of the Blue',
        "sales_price" => 37,
        "purchase_price" => purchase_price,
        "points" => 15,
        "status" => 0
      }
    end

    let(:first_product) do
      Product.first.attributes.except('id', 'created_at', 'updated_at', 'purchase_price_currency', 'sales_price_currency', 'product_type')
    end

    let(:filename) { 'pedido2-marykay.csv' }
    let(:imported_file) { fixture(filename) }

    it 'creates first product' do
      request.import_list(filename)

      expect(first_product).to eq(product_attributes)
    end
  end

end
