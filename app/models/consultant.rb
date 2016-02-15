class Consultant < ActiveRecord::Base
  has_many :requests
  has_many :products
  has_many :customers

  validates :name, presence: true
end
