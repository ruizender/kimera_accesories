class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
