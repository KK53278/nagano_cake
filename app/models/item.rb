class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  #指定された値と等しいか、それよりも大きくなければならないことを指定
  validate :image_type

def get_image(*size)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.png')
    image.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
　end
　if !size.empty?
    image.variant(resize: size)
  else
    image
  end
end 

end