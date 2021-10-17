class Order < ApplicationRecord
  belongs_to :user
  has_many :shopping_carts, dependent: :destroy
  has_many :products, through: :shopping_carts, dependent: :destroy


  def add_product(product_id, quantity) 
    product = Product.find(product_id) 
    if product && product.stock > 0
      shopping_carts.create(product_id: product.id, quantity: quantity)
    end 
  end


  def total_products
    totales = Shopping_cart
  end
end




