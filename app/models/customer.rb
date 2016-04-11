class Customer < ActiveRecord::Base
  belongs_to :consultant
  has_many :sales

  validates :name, :source, presence: true

  after_save :schedule_next_contact, if: 'next_contact_date_changed?'

  scope :must_contact_today, -> { where("next_contact_date BETWEEN ? AND ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day) }

  private

  def schedule_next_contact
    logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    logger.info "I am in customer.rb with my customer id: #{self.id}"
    logger.info "And my consultant is #{consultant.id}"
    ReminderWorker.perform_at(next_contact_date, consultant.id, self.id)
  end

end
