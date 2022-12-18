class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  #指定された値と等しいか、それよりも大きくなければならないことを指定
  validate :image_type

  scope :where_genre_active, -> { joins(:genre).where(genres: { is_active: true }) }

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

  def with_tax_price
    (price * 1.1).ceil
    # ceilは切り上げ、floorが切り捨て、roundが四捨五入
    # priceカラムをintegerにしておかないと切り上げできなくて痛い目見る
  end

  private

  def image_type
      if !image.blob
        errors.add(:image, 'をアップロードしてください')
      elsif !image.blob.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
      end
  end

end