class UserMailer < ApplicationMailer
  default from: "support@store.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.daily_mail.subject
  #
  def notification
    @orders = Order.all
    mail to: "tilen.kelc@gmail.com", subject: "Order reminder"
  end
end
