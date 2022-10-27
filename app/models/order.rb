class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details

  #credit_card:クレジットカード,transfer:銀行振込
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  enum is_active: {
    wait: 0,
    confirmation: 1,
    production: 2,
    preparation: 3,
    sent: 4
  }
end
