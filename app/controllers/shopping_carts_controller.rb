class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!

  def update
    product = params[:shopping_cart][:product_id]
    quantity = params[:shopping_cart][:quantity]
      
    current_order.add_product(product, quantity)
    redirect_to root_url, notice: "Producto Agregado con éxito!"
    end

  def show
    @order = current_order
  end
end
