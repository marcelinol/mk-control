class Consultant < ActiveRecord::Base
  validates :name, presence: true
end
