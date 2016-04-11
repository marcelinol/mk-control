class ReminderMailer < ActionMailer::Base
  default from: "lembrete@zengirls.com.br"

  def two_days_contact_reminder(consultant, customer)
    @consultant = consultant
    @customer = customer.decorate
    consultant_email = @consultant.users.first.email

    mail(to: consultant_email, subject: "Lembrete de contato com cliente: #{@customer.name}")
  end
end
