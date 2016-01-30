require 'rails_helper'

RSpec.describe Request, :type => :model do

  def fixture(name)
    File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', filename))
  end

  let(:consultant) { Consultant.create(name: 'testing') }
  let(:request)    { Request.new(consultant: consultant) }
  let(:discount)   { 0.35 }
  let(:purchase_price) { 37 * (1 - discount) }
  let(:product)    do
    binding.pry
    Product.create(
      consultant: consultant,
      request: request,
      code: 10081938,
      name: 'Trio de Sombras Out of the Blue',
      sales_price: 37,
      purchase_price: purchase_price,
      points: 35,
      status: 0
    )
  end

  context 'validations' do
    let(:request) { Request.new(consultant_id: nil) }

    it { expect(request).not_to be_valid }
  end

  let(:filename) { 'pedido2-marykay.csv' }
  let(:imported_file) { fixture(filename) }

  it 'creates first product' do
    request.import_list(filename)

    expect(Product.first).to eq(product)
  end

end
