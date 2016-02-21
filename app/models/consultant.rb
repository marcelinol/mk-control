class Consultant < ActiveRecord::Base
  has_many :requests
  has_many :products
  has_many :customers
  has_many :sales

  validates :name, presence: true

  after_save :update_balance, if: :must_update_balance?

  private

  def update_balance
    new_balance = self.income - self.outcome
    update_column(:balance, new_balance)
  end

  def must_update_balance?
    self.outcome_changed? || self.income_changed?
  end
end
