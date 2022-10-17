class Order < ApplicationRecord

  belongs_to :customer
  
  def customer_address
    "〒" + current_customer.postal_code + " " + current_customer.address + " " + current_customer.last_name + " " + current_customer.first_name
  end
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  #credit_card:クレジットカード,transfer:銀行振込
  enum purchase_price: {
    credit_card: 0,
    transfer: 1
  }
end
