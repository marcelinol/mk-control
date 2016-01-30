class Request < ActiveRecord::Base
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true
end
