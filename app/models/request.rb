class Request < ActiveRecord::Base
  belongs_to :consultant

  validates :consultant, presence: true
end
