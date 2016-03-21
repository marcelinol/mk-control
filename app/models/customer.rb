class Customer < ActiveRecord::Base
  belongs_to :consultant
  has_many :sales

  validates :name, :source, presence: true

  after_save :schedule_next_contact, if: 'next_contact_date_changed?'

  scope :must_contact_today, -> { where("next_contact_date BETWEEN '#{DateTime.now.beginning_of_day}' AND '#{DateTime.now.end_of_day}'") }

  private

  def schedule_next_contact
    ReminderWorker.perform_at(next_contact_date)
  end

end
