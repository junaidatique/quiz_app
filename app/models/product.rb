class Product < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :users, join_table: "products_users", foreign_key: "user_id"
end
