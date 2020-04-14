class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_num
      t.decimal :order_total
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone_num
      t.string :address
      t.string :city
      t.string :postal_num

      t.timestamps
    end
  end
end
