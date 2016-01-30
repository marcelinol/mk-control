class Request < ActiveRecord::Base
  belongs_to :consultant
  has_many   :products

  validates :consultant, presence: true

  def import_list(filename)
    # load_file
  end

  def load_file
    File.open(Rails.root.join('public', 'uploads', @filename), 'r') do |file|
      binding.pry
      #Parse CSV here
    end
  end
end
