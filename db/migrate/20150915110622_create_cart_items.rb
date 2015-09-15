class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :amount
      t.string :status
      t.date :change_status_date

      t.timestamps null: false
    end
  end
end
