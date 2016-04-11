# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'zengirls.com.br',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ENV['CODACY_PROJECT_TOKEN'] = "f7135fe3a4df41fd949b564c09d31354"
ENV['CODACY_RUN_LOCAL'] = "true"

# Initialize the Rails application.
Rails.application.initialize!
