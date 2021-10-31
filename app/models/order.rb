class Order < ApplicationRecord
  belongs_to :user
  has_many :shopping_carts, dependent: :destroy
  has_many :products, through: :shopping_carts, dependent: :destroy
  has_many :payments


  def to_s
    email  
  end

  def add_product(product_id, quantity) 
    product = Product.find(product_id)
    bag = self.shopping_carts.find_by_product_id(product.id)
    if product && (product.stock > 0)
      if bag.nil?
        shopping_carts.create(product_id: product.id, quantity: quantity, price: product.price )
      else
        bag.update_attribute(:quantity, bag.quantity + 1)
      end
      total_amount
    end 
  end

#metodo para sumar en el total del carrito
  def total_amount
    subtotal = 0
    self.shopping_carts.map do |product|
      subtotal += product.price * product.quantity
    end
    update_attribute(:total, subtotal)
  end
end




