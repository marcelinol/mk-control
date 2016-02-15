class Customer < ActiveRecord::Base
  belongs_to :consultant
  has_many :sales

  validates :name, :source, presence: true
end
