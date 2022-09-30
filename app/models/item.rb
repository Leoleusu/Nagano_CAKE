class Item < ApplicationRecord
  has_one_atacched :image

  def get_image(width,height)
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpeg')
       image.attach(io: File.open(file_path),filename: 'default-image',content_type: 'image/*')
     end
     image.variant(resize_to_limit:[width,height]).processed
  end
end
