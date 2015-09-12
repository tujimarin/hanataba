class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :change_status_date, :string
  end
end
