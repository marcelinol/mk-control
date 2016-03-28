class ReminderMailer < ActionMailer::Base
  default from: "lembrete@zengirls.com.br"

  def two_days_contact_reminder(consultant, customer)
    @consultant = consultant
    @customer = customer
    consultant_email = @consultant.users.first.email

    mail(to: consultant_email, subject: 'Testing!!')
  end
end
