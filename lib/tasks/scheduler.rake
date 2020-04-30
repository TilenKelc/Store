task :send_notification => :environment do
  UserMailer.notification.deliver
end
