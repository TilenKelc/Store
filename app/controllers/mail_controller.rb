class MailController < ApplicationController
  def send_mail
    UserMailer.order_update(1).deliver
  end
end
