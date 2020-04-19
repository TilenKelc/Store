ActiveAdmin.register Order do

  form title: 'Order' do |f|
    inputs 'Order details' do
      # input :status, as: :select, collection: options_for_select(['pending', 'processing', 'completed'], object.status), label: "STATUS", required: true
      para "STATUS OF ORDER: ", id: "status_order_para"
      select :status, options_for_select(['pending', 'processing', 'completed'], object.status)
      input :order_num, input_html: { disabled: true }, label: "ORDER NUM" 
      input :order_total, input_html: { disabled: true }, label: "ORDER TOTAL" 
      input :name, input_html: { disabled: true }, label: "NAME" 
      input :surname, input_html: { disabled: true }, label: "LASTNAME" 
      input :email, input_html: { disabled: true }, label: "EMAIL" 
      input :phone_num, input_html: { disabled: true }, label: "PHONE NUMBER" 
      input :address, input_html: { disabled: true }, label: "ADDRESS" 
      input :city, input_html: { disabled: true }, label: "CITY" 
      input :postal_num, input_html: { disabled: true }, label: "POSTAL NUMBER" 
      input :customer_id, input_html: { disabled: true }, label: "CUSTOMER" 
      input :item_id, input_html: { disabled: true }, label: "ITEM" 
      li "Ordered at #{f.object.created_at}" unless f.object.new_record?
      actions
    end
    inputs 'Order details' do
      input :order_num, label: "ORDER NUM" 
      input :order_total, label: "ORDER TOTAL" 
      input :name, label: "NAME" 
      input :surname, label: "LASTNAME" 
      input :email, label: "EMAIL" 
      input :phone_num, label: "PHONE NUMBER" 
      input :address, label: "ADDRESS" 
      input :city, label: "CITY" 
      input :postal_num, label: "POSTAL NUMBER" 
      input :customer_id, label: "CUSTOMER" 
      input :item_id, label: "ITEM" 
      actions
    end
  end

  permit_params :order_num, :order_total, :name, :surname, :email, :phone_num, :address, :city, :postal_num, :created_at, :updated_at, :status, :item_id


end