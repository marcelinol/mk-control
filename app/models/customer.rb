class Customer < ActiveRecord::Base
  has_many :sales

  validates :name, :source, presence: true
end
