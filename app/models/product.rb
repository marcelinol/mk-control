class Product < ActiveRecord::Base
  belongs_to :consultant
  belongs_to :request
  belongs_to :sale

  validates :name, :consultant, :request, presence: true

  enum status: [:stock, :sold, :sample, :to_be_defined]

  scope :in_stock,       -> { where(status: 0) }
  scope :sold,          -> { where(status: 1) }
  scope :sample,        -> { where(status: 2) }
  scope :to_be_defined, -> { where(status: 3) }

end
