class Book < ApplicationRecord

   has_one_attached :image
   belongs_to :user


   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type:'image/jpg')
    end
    image
   end

end
