json.extract! order, :id, :order_num, :order_total, :name, :surname, :email, :phone_num, :address, :city, :postal_num, :created_at, :updated_at
json.url order_url(order, format: :json)
