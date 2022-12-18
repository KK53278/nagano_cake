class Genre < ApplicationRecord
  has_many :items

  scope :only_active, -> { where(is_active: true) }
  # モデルのスコープ機能scope :スコープの名前, -> { 条件式 }
  validates :name, presence: true, uniqueness: true
end
