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

  def order_update
    @order = Order.find_by_id(params[:id])
    mail to: @order.email, subject: "Order update"
  end
end
