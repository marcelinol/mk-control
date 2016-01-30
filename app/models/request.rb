class Request < ActiveRecord::Base
  require 'csv'
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true

  def import_list(filename)
    load_file(filename)
  end

  def load_file(filename)
    File.open(Rails.root.join('public', 'uploads', filename), 'r') do |file|
      CSV.foreach(file, headers: true) do |row|
        quantity = row["                   Quantidade Solicitada/Enviada/Cancelada"].match(/^\d/)[0].to_i
        quantity.times do
          code = row["Código do produto"].to_i
          name = row["Descrição"]
          sales_price = row["Preço unitário de varejo"].to_i
          points = row["Pontos"].to_i
          purchase_price = sales_price * 0.65
          Product.create(code: code, name: name, sales_price: sales_price, points: points, consultant: consultant, request: self, purchase_price: purchase_price)
        end
      end
    end
  end
end
