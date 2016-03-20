class ReminderMailer < ActionMailer::Base
  default from: "from@example.com"

  def two_days_contact_reminder(consultant)
    @consultant = consultant
    consultant_email = @consultant.users.first.email

    mail(to: consultant_email, subject: 'Testing!!')
  end
end
