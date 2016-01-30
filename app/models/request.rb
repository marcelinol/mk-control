class Request < ActiveRecord::Base
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true

  def initialize(filename, consultant_id = 1)
    @filename = filename
    @consultant_id = counsultant_id
  end

  def load_file
    File.open(Rails.root.join('public', 'uploads', filename), 'r') do |file|
      #Parse CSV here
    end
  end
end
