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
        status = "stock"
        quantity.times do

          if row["Código do produto"].match(/^--/)
            code = row["Código do produto"].match(/\d/)[0].to_i
            status = "to_be_defined"
          else
            code = row["Código do produto"].to_i
          end

          name = row["Descrição"]
          sales_price = row["Preço unitário de varejo"].to_money

          if sales_price == 0
            status = "to_be_defined"
          end

          points = row["Pontos"].to_i
          purchase_price = (sales_price * 0.65).to_money

          Product.create(code: code, name: name, sales_price: sales_price, points: points, consultant: consultant, request: self, purchase_price: purchase_price, status: status)
        end
      end
    end
  end
end
