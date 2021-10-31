class ShoppingCart < ApplicationRecord
  belongs_to :order
  belongs_to :product



  def new_total_order
    self.order.update_attribute(:total, self.order.total - self.price) 
  end
end
