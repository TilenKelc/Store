class CheckoutController < ApplicationController
    
    def create
        @order = Order.find(params[:id])
        @item = Item.find(params[:item_id])

        if @item.nil?
            redirect_to root_path
            return
        end

        # Setting up a Stripe Session for a payment
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @item.name,
                amount: Integer(@item.price * 100),
                currency: 'eur',
                quantity: @order.quantity
            }],
            success_url: 'http://localhost:3000/checkout/' + @order.id.to_s + '/success', 
            cancel_url: root_url
        )
        
        respond_to do |format|
            format.js
        end
    end

    def success
        @order = Order.find(params[:id])
        @order.update(payment_option: "Credit card", status: "completed")
    end

    def cancel
    end

end
