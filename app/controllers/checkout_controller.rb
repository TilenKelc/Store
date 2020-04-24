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
        # Order.new(:order_num => 12345, :order_total => 30.0, :name => "Janez", :surname => "Novak", :email => "Janez@gmail.com", :phone_num => "0869949494", :address => "Pesje", :city => "Pesje", :postal_num => "3320", :customer_id => 1, :status => "pending", :item_id => 1, :payment_option => "Janez", :quantity => 1)
        puts @order.id
    end

    def cancel
    end

end
