class Consultant < ActiveRecord::Base
  has_many :requests
  has_many :products

  validates :name, presence: true
end
