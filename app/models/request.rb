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
            code: row["Código do produto"],
            name: row["Descrição"],
            sales_price: sales_price,
            purchase_price: (sales_price * 0.65),
            points: row["Pontos"].to_i,
            status: 0,
            consultant: consultant,
            request: self
          }

          handle_code(params)
          handle_name(params)

          Product.create(params)
        end
      end
    end
  end

  def handle_code(params)
    if params[:code].match(/^--/)
      params[:code] = params[:code].match(/\d/)[0].to_i
      params[:status] = "to_be_defined"
    else
      params[:code] = params[:code].to_i
    end
  end

  def handle_name(params)
    params[:status] = "to_be_defined" if params[:name].match(/amostra/i)
  end
end
