class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :braintree_customer_id

      t.timestamps null: false
    end
  end
end
