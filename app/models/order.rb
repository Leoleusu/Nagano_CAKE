class Order < ApplicationRecord

  belongs_to :customer

  #credit_card:クレジットカード,transfer:銀行振込
  enum purchase_price: {
    credit_card: 0,
    transfer: 1
  }
end
