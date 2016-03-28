# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def two_days_contact_reminder_preview
    ReminderMailer.two_days_contact_reminder(Consultant.first, Customer.first)
  end
end
