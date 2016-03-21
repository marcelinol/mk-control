class Request < ActiveRecord::Base
  require 'csv'
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true

  after_save :update_consultant_outcome, if: "self.total_cost_changed?"

  def import_list(filename)
    load_file(filename)
    self.total_cost = products.pluck(:purchase_price).inject { |total, price| total + price }
    save
  end

  def load_file(file_path)
    File.open(file_path, 'r') do |file|
      CSV.foreach(file, headers: true) do |row|
        quantity = row["Quantidade Solicitada/Enviada/Cancelada"].match(/^\d/)[0].to_i
        quantity.times do
          sales_price = BigDecimal.new(row["Preço unitário de varejo"])
          params = {
            code: row["Código do produto"],
            name: row["Descrição"],
            sales_price: sales_price,
            purchase_price: (sales_price * 0.65),
            points: row["Pontos"].to_i,
            status: 'in_stock',
            consultant: consultant,
            request: self
          }

          handle_code(params)
          handle_weird_products(params)

          Product.create(params)
        end
      end
    end
  end

  private

  def handle_code(params)
    if params[:code].match(/^--/)
      params[:code] = params[:code].match(/\d/)[0].to_i
      params[:status] = "to_be_defined"
    else
      params[:code] = params[:code].to_i
    end
  end

  def handle_weird_products(params)
    params[:status] = "to_be_defined" if has_weird_behaviour?(params)
  end

  def has_weird_behaviour?(params)
    params[:sales_price] == 0 || params[:points] == 0 || params[:name].match(/amostra/i)
  end

  def update_consultant_outcome
    self.consultant.outcome += self.total_cost
    self.consultant.save
  end
end
