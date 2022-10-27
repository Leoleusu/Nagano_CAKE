class AddColumnsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_details, :item, foreign_key: true
    add_reference :order_details, :order, foreign_key: true
  end
end
