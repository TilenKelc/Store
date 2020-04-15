class AddOrderRefToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :item, foreign_key: true
  end
end
