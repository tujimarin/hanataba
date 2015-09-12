class RemoveColumnToUserItems < ActiveRecord::Migration
  def change
    remove_column :user_items, :change_status_date, :string
  end
end
