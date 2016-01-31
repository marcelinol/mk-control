class Product < ActiveRecord::Base
  belongs_to :consultant
  belongs_to :request

  validates :name, :consultant, :request, presence: true

  enum status: [:stock, :sold, :sample, :to_be_defined]

end
