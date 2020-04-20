class AddFieldsToOrders2 < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payment_option, :string
    add_column :orders, :quantity, :integer
  end
end
