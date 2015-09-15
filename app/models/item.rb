class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :users, through: :user_items
end
