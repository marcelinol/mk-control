class Consultant < ActiveRecord::Base
  has_many :requests
  has_many :products
  has_many :customers

  validates :name, presence: true

  after_save :update_balance, if: :must_update_balance?

  private

  def update_balance
    self.balance = self.income - self.outcome
  end

  def must_update_balance?
    self.outcome_changed? || self.income_changed?
  end
end
