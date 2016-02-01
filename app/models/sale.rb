class Sale < ActiveRecord::Base
  belongs_to :customer
  has_many   :products

  validates :customer, presence: true

  after_create :calculate_total_cost

  private

  def calculate_total_cost
    self.total_cost = BigDecimal.new(products.pluck(:sales_price).inject(0, :+))
    self.save
  end
end
