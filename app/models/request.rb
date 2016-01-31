class Request < ActiveRecord::Base
  require 'csv'
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true

  def import_list(filename)
    load_file(filename)
  end

  def load_file(file_path)
    File.open(file_path, 'r') do |file|
      CSV.foreach(file, headers: true) do |row|
        quantity = row["                   Quantidade Solicitada/Enviada/Cancelada"].match(/^\d/)[0].to_i
        status = "stock"
        quantity.times do
          sales_price = BigDecimal.new(row["Preço unitário de varejo"])
          params = {
            code: handle_code(row["Código do produto"]),
            name: row["Descrição"],
            sales_price: sales_price,
            purchase_price: (sales_price * 0.65),
            points: row["Pontos"].to_i,
            status: 0,
            consultant: consultant,
            request: self
          }

          Product.create(params)
        end
      end
    end
  end

  def handle_code(code_cell)
    if code_cell.match(/^--/)
      code = code_cell.match(/\d/)[0].to_i
    else
      code = code_cell.to_i
    end
  end
end
