class Product < ApplicationRecord
  belongs_to :category
  has_many :shopping_carts, dependent: :destroy
  has_many :orders, through: :shopping_carts, dependent: :destroy
  validates :name, presence: true
  def to_s
    name
  end
end
