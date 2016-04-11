class Customer < ActiveRecord::Base
  belongs_to :consultant
  has_many :sales

  validates :name, :source, presence: true

  after_save :schedule_next_contact, if: 'next_contact_date_changed?'
  after_save :generate_url_link, if: 'address_changed?'

  scope :must_contact_today, -> { where("next_contact_date BETWEEN ? AND ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day) }

  private

  def schedule_next_contact
    ReminderWorker.perform_at(next_contact_date, consultant.id, self.id)
  end

  def generate_url_link
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    if geo.success?
      self.update_column(:address_link, "http://maps.google.com/?q=#{geo.ll}")
    end
  end

end
