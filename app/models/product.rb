class Product < ApplicationRecord
  belongs_to :category
  has_many :shopping_carts, dependent: :destroy
  has_many :orders, through: :shopping_carts, dependent: :destroy
  validates :name, :sku, :descriptions, :stock, :price, :pictures, presence: true
  ratyrate_rateable "price"
  has_many_attached :pictures

  def to_s
    name
  end



end
