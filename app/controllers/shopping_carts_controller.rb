class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product , only: %i[destroy]

  def update
    product = params[:shopping_cart][:product_id]
    quantity = params[:shopping_cart][:quantity]
    current_order.add_product(product, quantity)
    redirect_to root_url, notice: "Producto Agregado con éxito!"
    end

  def show
    @order = current_order
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to shopping_cart_url, notice: "Se borro tu producto del carrito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def find_product
      @cart = ShoppingCart.find(params[:id])
    end
end
