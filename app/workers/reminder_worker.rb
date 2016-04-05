class ReminderWorker

  include Sidekiq::Worker

  def perform(consultant_id, customer_id)
    consultant = Consultant.find(consultant_id)
    customer = Customer.find(customer_id)
    logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    logger.info "I got consultant #{consultant.name} with id #{consultant.id}"
    logger.info "I got customer #{customer.name} with id #{customer.id}"
    ReminderMailer.two_days_contact_reminder(consultant, customer).deliver
  end

end
