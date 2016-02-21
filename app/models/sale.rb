class Sale < ActiveRecord::Base
  belongs_to :customer
  belongs_to :consultant
  has_many   :products

  validates :customer, presence: true

  before_save :calculate_value
  after_save  :update_consultant_income, if: :must_update_consultant_income?

  private

  def calculate_value
    self.value = BigDecimal.new(products.pluck(:sales_price).inject(0, :+))
  end

  def update_consultant_income
    self.consultant.income += self.value
  end

  def must_update_consultant_income?
    self.value_changed?
  end
end
