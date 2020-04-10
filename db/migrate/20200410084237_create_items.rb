class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :desc
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
