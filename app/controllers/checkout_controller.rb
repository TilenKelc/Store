class CheckoutController < ApplicationController
    
    def create
        @item = Item.find(params[:id])

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
                quantity: 1
            }],
            success_url: checkout_success_url, 
            cancel_url: checkout_cancel_url
        )
        
        respond_to do |format|
            format.js
        end
    end

    def success;
    end

    def cancel;
    end

end
