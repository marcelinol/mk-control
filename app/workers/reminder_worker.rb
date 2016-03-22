class ReminderWorker

  include Sidekiq::Worker

  def perform(consultant_id)
    consultant = Consultant.find(consultant_id)
    ReminderMailer.two_days_contact_reminder(consultant).deliver
  end

end
