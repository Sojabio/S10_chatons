class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_one_attached :photo

  validates :title, :description, :price, presence: true
  
  validates :title, uniqueness: true, length: { maximum: 23 }
  
  validates :price, numericality: { greater_than: 0 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  #rajouter les images en obligatoire dans la validation

end
