class Order < ApplicationRecord
  belongs_to :customer

  has_many :items, through: :order_details

  scope :ordered_today, -> { where(created_at: Time.current.at_beginning_of_day..Time.current.at_end_of_day) }
end
