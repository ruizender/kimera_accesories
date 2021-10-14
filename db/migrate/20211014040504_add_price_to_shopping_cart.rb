class AddPriceToShoppingCart < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_carts, :price, :integer
  end
end
