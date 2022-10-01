class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

  #active=販売中、stop=販売停止中
  enum is_active: {
    active: 1,
    stop: 2
  }

  def get_image(width,height)
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpeg')
       image.attach(io: File.open(file_path),filename: 'default-image',content_type: 'image/*')
     end
     image.variant(resize_to_limit:[width,height]).processed
  end
end
