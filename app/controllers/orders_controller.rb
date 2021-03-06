class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @item = Item.find_by_id(params[:id])
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Order_" + @order.order_num.to_s,
               template: "orders/show.html.erb",
               layout: "pdf.html"
      end
    end
  end

  # GET /orders/new
  def new
    @item = Item.find_by_id(params[:id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @item = Item.find_by_id(params[:id])
    @order = Order.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Order_" + @order.order_num.to_s,
               template: "orders/show.html.erb",
               layout: "pdf.html"
      end
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @item = Item.find_by_id(order_params[:item_id])
    @order.order_num = rand(10000..100000)
    @order.order_total = @order.quantity * @item.price
    @order.status = "pending"
    @order.customer = current_customer
    @order.item = @item
    @order.payment_option = "not paid"

    respond_to do |format|
      if @order.save
        format.html { redirect_to "/orders/" + @order.id.to_s + "/edit" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to root_path, notice: "Order completed." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:name, :surname, :phone_num, :address, :city, :postal_num, :payment_option, :quantity, :email, :item_id)
  end
end
