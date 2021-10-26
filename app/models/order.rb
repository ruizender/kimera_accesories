class Order < ApplicationRecord
  belongs_to :user
  has_many :shopping_carts, dependent: :destroy
  has_many :products, through: :shopping_carts, dependent: :destroy
  has_many :payments


  
  def add_product(product_id, quantity) 
    product = Product.find(product_id) 
    if product && product.stock > 0
      shopping_carts.create(product_id: product.id, quantity: quantity, price: product.price)
      total_amount
    end 
  end

#metodo para sumar en el total del carrito
  def total_amount
    subtotal = 0
    self.shopping_carts.map do |product|
      subtotal += product.price.to_i
    end
    update_attribute(:total, subtotal)
  end
end




