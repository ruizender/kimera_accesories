class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :description
      t.string :photo
      t.integer :stok
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
