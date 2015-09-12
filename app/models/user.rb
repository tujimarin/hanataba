class User < ActiveRecord::Base
  has_secure_password
  has_many :user_items
  has_many :items, through: :user_items
end
