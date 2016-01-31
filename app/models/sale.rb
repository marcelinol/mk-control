class Sale < ActiveRecord::Base
  belongs_to :customer
  has_many   :products

  validates :customer, presence: true
end
