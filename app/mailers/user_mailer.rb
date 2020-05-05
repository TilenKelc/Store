class UserMailer < ApplicationMailer
  before_action :set_order, only: [:order_update]

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
    mail to: @order.email, subject: "Order update"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end
