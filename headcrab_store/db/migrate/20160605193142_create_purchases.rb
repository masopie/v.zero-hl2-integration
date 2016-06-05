class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :headcrab_id
      t.integer :buyer_id

      t.timestamps null: false
    end
    add_index :purchases, [:headcrab_id, :buyer_id], unique: true
  end
end
