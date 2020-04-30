class MailController < ApplicationController
  def send_mail
    UserMailer.notification.deliver
  end
end
