class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    first_name + " " + last_name
  end

  def has_in_cart(item)
    cart_items.find_by(item_id: item.id)
    # cart_itemsモデルからitem.idを引き渡された1件を取得?
  end

end
