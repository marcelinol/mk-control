class Sale < ActiveRecord::Base
  belongs_to :customer
  has_many   :products

  validates :customer, presence: true

  before_save :calculate_value

  private

  def calculate_value
    self.value = BigDecimal.new(products.pluck(:sales_price).inject(0, :+))
  end
end
