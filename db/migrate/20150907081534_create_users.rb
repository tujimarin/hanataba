class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :postal_code
      t.string :address
      t.string :credit_card
      t.integer :tel
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
