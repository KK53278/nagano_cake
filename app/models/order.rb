class Order < ApplicationRecord
  belongs_to :customer

  has_many :items, through: :order_details

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :destination, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :grand_total, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  
  scope :ordered_today, -> { where(created_at: Time.current.at_beginning_of_day..Time.current.at_end_of_day) }

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_deposit: 0, confirm_deposit: 1, in_production: 2, preparing_shipment: 3, shipped: 4 }
  # enumで数値と文字列を紐付けるための記述
  # rails cで確認するときは複数形なので注意
end
