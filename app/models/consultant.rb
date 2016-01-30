class Consultant < ActiveRecord::Base
  has_many :requests

  validates :name, presence: true
end
