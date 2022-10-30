class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum is_active: {
    impossible: 0,
    wait: 1,
    production: 2,
    finished: 3
  }
end
