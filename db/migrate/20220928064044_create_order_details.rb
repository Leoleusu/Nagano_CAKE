class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :purchase_price ,null: false
      t.integer :amount ,null: false
      t.integer :is_active ,null: false,default: "0"

      t.timestamps
    end
  end
end
