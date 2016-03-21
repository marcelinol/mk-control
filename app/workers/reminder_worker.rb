class ReminderWorker

  include Sidekiq::Worker

  def perform
    puts 'xunda >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> xunda >>>>>>>>>>>>>>>>>>>>>>>>>>'
  end

end
