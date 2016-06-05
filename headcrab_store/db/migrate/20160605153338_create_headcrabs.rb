class CreateHeadcrabs < ActiveRecord::Migration
  def change
    create_table :headcrabs do |t|
      t.string :name
      t.integer :birthday
      t.float :price
      t.text :description
      t.string :pic_url

      t.timestamps null: false
    end
  end
end
