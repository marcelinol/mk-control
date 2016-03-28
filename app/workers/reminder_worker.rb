class ReminderWorker

  include Sidekiq::Worker

  def perform(consultant_id, customer_id)
    consultant = Consultant.find(consultant_id)
    customer = Customer.find(customer_id)
    ReminderMailer.two_days_contact_reminder(consultant, customer).deliver
  end

end
