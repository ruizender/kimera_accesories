class ChangeDescriptionsFromProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :descriptions, :description
  end
end
