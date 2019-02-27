class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true  
  validates :password, presence: true, allow_nil: true
  validates :name, presence: true

  has_and_belongs_to_many :products, join_table: "products_users", foreign_key: "product_id"
  has_and_belongs_to_many :groups, join_table: "groups_users", foreign_key: "group_id"
end
