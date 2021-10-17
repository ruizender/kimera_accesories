class ChangeNameToTableProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :stok, :stock
  end
end
