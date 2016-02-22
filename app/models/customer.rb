class Customer < ActiveRecord::Base
  belongs_to :consultant
  has_many :sales

  validates :name, :source, presence: true

  scope :must_contact_today, -> { where("next_contact_date BETWEEN '#{DateTime.now.beginning_of_day}' AND '#{DateTime.now.end_of_day}'") }

end
